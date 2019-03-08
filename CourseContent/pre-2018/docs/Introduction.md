# Introduction

Getting to grips with the environment we are using, understanding how to save your work
and avoid losing anything.

## The cloud

It is simpler for us to set up this course on our machines and provide access to you than it is for
us to provide the material for your machine. Even simpler is to use a machine in the cloud that is designed
to be accessible, reliable and temporary. We start with a blank machine and install only the software that
we need for the course. This helps us provide a stable environment for you. However, it does mean that
you need to download your work and keep a copy locally. Once the course is over, the machine will be
decommissioned and your copy will be the only copy !  If you want to continue to access the course
materials, you need to install our docker container. 

## Docker

The environment we use is hosted in a `docker container`
(see [docker.com](http://www.docker.com) for more information) which
runs in the cloud during courses, but can easily be run on your laptop later
so that you have the identical tools at your disposal whenever you need to
revisit the training. This is a virtual environment that allows us to give you
exactly the versions of every piece of code and be sure it will run the same
anywhere.

## Jupyter notebooks

All of the code is found in `jupyter` notebooks which are rapidly becoming the standard
lab notebook for scientific coding. You can mix text, equations, code (not just python),
images, and so on into a single *live document*.

The notebook is a series of cells that can be executed individually. This can be
very helpful as you can work on little segments of an idea and get that right before
moving on to the next part.

Of course, you have to be a little bit careful about the order you do things and you
can get into a real mess if you are not organised. We'll no doubt make mistakes and
see what 'organised' means.

## ipython

In the notebooks, we will use `ipython` rather than python. The 'i' is for *interactive* and
introduces some useful ideas such as completion of words, module names, function arguments
which can alleviate some of the disadvantages in working in such an extensible environment as python.
`ipython` gives some *magic* commands which drill through to the underlying filesystem or give
access to fine-tuning of the notebook behaviour.
`ipython` combined with the notebooks also provides help commands as pop-up menus.

## LaTeX

Mathematical equations are difficult to typeset unless you are familiar with tools like `latex`
or  \\( \LaTeX \\) as it is supposed to be written. This is not something you need to learn, but it can be
helpful if you truly need to write equations in your notebook.

[This page](https://davidhamann.de/2017/06/12/latex-cheat-sheet/) might be helpful.
