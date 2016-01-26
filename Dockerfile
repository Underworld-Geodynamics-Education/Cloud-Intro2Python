FROM lmoresi/unimelb-debian-base:v1.02

## =============================================================
## base - image ... whatever functionality you want to provide !
## =============================================================

## Grab the content from github

RUN git clone https://github.com/lmoresi/docker-website-notebooks.git /demonstration/ # Watch the cache !

## Add an external volume within the same mount point

VOLUME /demonstration/ExternalContent/

## Update the ruby dependencies and build the site

WORKDIR /demonstration
RUN bundle install
RUN ls -l _scripts

RUN . _scripts/docker-site-builder

# Create a non-privileged user to run the notebooks and switch to this user for the server

RUN useradd --create-home --home-dir /home/demon --shell /bin/bash --user-group demon
RUN chown -R demon:demon /demonstration

USER demon
ENV HOME=/demonstration
ENV SHELL=/bin/bash
ENV USER=demon


# Launch the notebook server from the Notebook directory
# The file_to_run option actually does nothing with the no-browser option ...
# but perhaps there is something else that would do this.

WORKDIR /demonstration
EXPOSE 8080 
ENTRYPOINT ["/usr/local/bin/tini", "--"]


CMD . _scripts/docker-runservers
# CMD /bin/bash

# CMD jupyter notebook --ip=0.0.0.0 --no-browser \
#     --NotebookApp.default_url='/b/StartHere.ipynb'
