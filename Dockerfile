FROM lmoresi/unimelb-debian-base:v1.03

## =============================================================
## base - image ... whatever functionality you want to provide !
## =============================================================

## Grab (this) content from github

RUN git clone https://github.com/lmoresi/docker-web-notebook-server.git /demonstration/ # Watch the cache !

## Link your content to the "Content" directory at the root level of this module
## If you don't have any content then use the example content !!

WORKDIR /demonstration
RUN ln -s ExampleContent/ Content/

## I always link the _site/Content/Notebook directories back to their originals
## (they are ignored by the build by default)
## This means edits live in the original location and can be checked back in via git if needed

RUN cd _site/Content 


## Update the ruby dependencies and build the site

RUN bundle install

RUN ls -al
RUN _scripts/docker-site-builder

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
