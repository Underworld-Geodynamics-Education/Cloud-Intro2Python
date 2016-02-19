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

ADD notebooks /home/researcher/notebooks

# Install Python
RUN apt-get install -y python3 python3-pip

# Install Jupyter
RUN sudo pip3 install jupyter ipython

RUN rm /etc/nginx/conf.d/*.conf && \
  sed -i '1s/^/daemon off;\n/' /etc/nginx/nginx.conf

RUN su - researcher -c "mkdir -p ~/.jupyter && echo \"c.NotebookApp.base_url = '/jupyter'\" > ~/.jupyter/jupyter_notebook_config.py"

ADD /etc /etc

# Run all processes through supervisord
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

RUN nginx -t
