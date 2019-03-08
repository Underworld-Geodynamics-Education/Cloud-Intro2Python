# VIEPS introduction to python

Course notes and live examples

Optimised for a Docker environment.


## Structure of this repository

mkdocs.yml

- Data:
  - Reference:  sample datasets that are stored locally
  - Resources:  scratch space - ignored by docker

- Notebooks:  jupyter notebooks (course content)

- docs: mkdocs pages to form the static site

- Docker: Dockerfiles (base + course)

- Private: Notes and Solutions that are not copied into the container

- scripts: Build scripts (can be run within the container to build or maintain it)

- www:

- build:


```python

import quagmire
print("Hello world")

```