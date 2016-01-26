FROM lmoresi/unimelb-debian-base:v1.02

## =============================================================
## base - image ... whatever functionality you want to provide !
## =============================================================

# Create a non-privileged user to run the notebooks

RUN useradd --create-home --home-dir /home/demon --shell /bin/bash --user-group demon
RUN mkdir /demonstration && chown demon:demon /demonstration

# skip if you need to change things in the live container

USER demon
ENV HOME=/demonstration
ENV SHELL=/bin/bash
ENV USER=demon
WORKDIR $HOME

RUN git clone https://github.com/lmoresi/docker-website-notebooks.git /demonstration/ # Watch the cache !

RUN bundle install
RUN _scripts/docker-site-builder

# Make a scratch directory available to connect to the host machine.
# Make the Notebook Resources directory available for extracting outputs etc
# Should not be needed as I put a README there in the repo

VOLUME /demonstration/ExternalContent/

# Launch the notebook server from the Notebook directory
# The file_to_run option actually does nothing with the no-browser option ...
# but perhaps there is something else that would do this.

WORKDIR /demonstration
EXPOSE 8888
ENTRYPOINT ["/usr/local/bin/tini", "--"]

# CMD _scripts/docker-runservers
CMD /bin/bash

# CMD jupyter notebook --ip=0.0.0.0 --no-browser \
#     --NotebookApp.default_url='/b/StartHere.ipynb'
