FROM debian:8

# Everything is exposed via one HTTP port
EXPOSE 8080

# Directories that don't need to be preserved in images
VOLUME ["/var/cache/apt", "/tmp"]

# Install Nginx repo
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key 7BD9BF62 && \
  echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list && \
  echo "deb-src http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list

# Install
# - supervisord for monitoring
# - nginx for reverse-proxying
# - sudo and passwd for creating user/giving sudo
# - Git and development tools
RUN apt-get update && apt-get install -y \
  supervisor \
  nginx \
  sudo passwd \
  git vim nano curl wget tmux screen bash-completion man \
  tar zip unzip

# Create researcher user
RUN useradd -m researcher -s /bin/bash && \
  gpasswd -a researcher sudo && \
  passwd -d researcher && passwd -u researcher && \
  rm ~researcher/.bashrc ~researcher/.bash_logout ~researcher/.profile

# Add notebooks to use homedir
ADD notebooks /home/researcher

# Python 3 needs a non-ASCII locale to work properly with the "click" module
ENV LC_ALL="C.UTF-8" LANG="C.UTF-8"

# Install Python
RUN apt-get install -y python3 python3-pip libzmq-dev libyaml-dev

# Install Jupyter
RUN pip3 install jupyter ipython

# Remove default nginx configs, and change config so supervisord can run it
RUN rm /etc/nginx/conf.d/*.conf && \
  sed -i '1s/^/daemon off;\n/' /etc/nginx/nginx.conf

# Add Jupyter config so it starts under path "/jupyter"
RUN su - researcher -c "mkdir -p ~/.jupyter && echo \"c.NotebookApp.base_url = '/jupyter'\" > ~/.jupyter/jupyter_notebook_config.py"

# Copy etc configs, including nginx and supervisord
ADD /etc /etc

# Run all processes through supervisord
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

# Test Nginx config
RUN nginx -t

# Copy source to compile for web pages
ADD www /var/www/src

# Install latest (Python 3 bug-free) version of click, then mkdocs
RUN pip3 install --upgrade git+https://github.com/mitsuhiko/click.git && \
  pip3 install --upgrade mkdocs

# Build mkdocs documentation
RUN cd /var/www/src && mkdocs build -v -d /var/www/html
