FROM jupyterhub/singleuser:0.9.4

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

USER root

# RUN apt-get update -y ;
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends --fix-missing \
        gcc gfortran \
        && rm -rf /var/lib/apt/lists/*


RUN conda install -y numpy scipy cartopy gdal 
RUN pip install stripy


# RUN useradd --create-home --home-dir /home/jovyan --shell /bin/bash --user-group jovyan || true

RUN addgroup jovyan  || true
RUN usermod -a -G jovyan jovyan || true

WORKDIR  /home/jovyan
USER jovyan

## These are the build templates etc
ADD --chown=jovyan:jovyan  CourseContent/Data/Reference Data/Reference
ADD --chown=jovyan:jovyan  CourseContent/Data/Resources Data/Resources
ADD --chown=jovyan:jovyan  CourseContent/Notebooks Notebooks
ADD --chown=jovyan:jovyan  Docker/jupyter_notebook_config.py .jupyter/jupyter_notebook_config.py


## Update / build the site
# RUN ./scripts/run-sitebuilder.py

# Trust all notebooks
# RUN find -name \*.ipynb  -print0 | xargs -0 jupyter trust


# Persistent / Shared space outside the container
VOLUME /home/jovyan/Data/Resources
VOLUME /home/jovyan/build


# expose notebook port and server port
EXPOSE 8888


# note we use xvfb which to mimic the X display for lavavu
ENTRYPOINT []
CMD ["jupyter", "lab","--ip=0.0.0.0","--allow-root", "--NotebookApp.token=''"]
