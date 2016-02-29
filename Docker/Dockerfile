FROM lmoresi/unimelb-debian-base:v1.04

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

RUN pip install mkdocs

RUN mkdir /demonstration
WORKDIR /demonstration

## These are the build templates etc
ADD docs docs
ADD jupyter-server-theme jupyter-server-theme
ADD Notebooks Notebooks
ADD scripts scripts
ADD mkdocs.yml mkdocs.yml

## Update the ruby dependencies and build the site


RUN ./scripts/run-sitebuilder

# Create a non-privileged user to run the notebooks and switch to this user for the server

RUN useradd --create-home --home-dir /home/demon --shell /bin/bash --user-group demon
RUN chown -R demon:demon /demonstration

USER demon
ENV HOME=/demonstration
ENV SHELL=/bin/bash
ENV USER=demon

# Launch the notebook server from the Notebook directory
# but perhaps there is something else that would do this.

WORKDIR /demonstration
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/tini", "--"]

CMD scripts/run-jupyter -p 8080
