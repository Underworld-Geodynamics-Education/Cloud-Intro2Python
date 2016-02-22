FROM lmoresi/unimelb-debian-base:v1.03

## =============================================================
## base - image ... whatever functionality you want to provide !
## This is my unix / python stuff (but it doesn't have underworld)
##
## This dockerfile builds an image from this content, and serves the
## sample web pages and notebooks at port 8080
##
## docker run -p 8181:8080 --name="docker-web-notebooks-test" -t lmoresi/lmoresi/docker-web-notebooks-module
## and then browse the docker VM ip address on port 8181 (for example)
##
## OR just use kitematic and click on the preview image
##
## =============================================================

## Grab (this) content from github

# RUN git clone https://github.com/lmoresi/docker-web-notebook-server.git /demonstration/ # Watch the cache !


## Link your content to the "Content" directory at the root level of this module
## If you don't have any content then use the example content !!

RUN mkdir /demonstration
WORKDIR /demonstration

## These are the build templates etc
ADD _scripts  _scripts
ADD _layouts  _layouts
ADD _includes _includes
ADD _assets   _assets
ADD Gemfile   Gemfile
ADD config.rb config.rb

## And this is the example content
ADD ExampleContent Content
ADD ExampleContent/_config.yml _config.yml

## Update the ruby dependencies and build the site

RUN bundle install

RUN ./_scripts/docker-site-builder

# Create a non-privileged user to run the notebooks and switch to this user for the server

RUN useradd --create-home --home-dir /home/demon --shell /bin/bash --user-group demon
RUN chown -R demon:demon /demonstration

USER demon
ENV HOME=/demonstration
ENV SHELL=/bin/bash
ENV USER=demon

## Add an external volume which can replace the default content
## and a place to build the site locally (which will also capture any edited notebooks)

VOLUME /demonstration/Content
VOLUME /demonstration/_site

# Launch the notebook server from the Notebook directory
# The file_to_run option actually does nothing with the no-browser option ...
# but perhaps there is something else that would do this.

WORKDIR /demonstration
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/tini", "--"]

CMD _scripts/docker-runservers
