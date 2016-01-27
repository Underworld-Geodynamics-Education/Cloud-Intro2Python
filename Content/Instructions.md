---
layout: home
title: Instructions - how to add your own content
author: Louis Moresi
description:
---

_This is the non-trivial part of the instruction manual ... using this template to make your content available to other people_

# Getting started

Ultimately you probably want to fork this project, build a new docker image with your own software stack, and replace my content with something more relevant.

As a first step, though, you can use the docker VOLUMEs to over-ride my content and also to capture the results of rebuilding the site and editing notebooks.  





# What is installed

The unix environment you are working in depends on the setup of your Docker machine. This is determined from the `Dockerfile` in the home directory. The `FROM` command at the start of this file is the base image that is downloaded and used  
