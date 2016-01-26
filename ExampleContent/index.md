---
layout: home
title: Introduction
description: Course notes
permalink: index.html
---

_This is a collection of tools to set up a web server in a docker container that mixes static html content and dynamic "literate-programming" content via jupyter notebooks._

# Introduction

[Jupyter](www.jupyter.org) notebooks blend well-formatted documentation with executable programming content. Notebooks not only provide a development environment for exploring new algorithms and implementation, they are an excellent way to introduce new software concepts through live demonstrations and example code.

[Docker](www.docker.com) is a mechanism for deploying complex software stacks as lightweight "apps" and managing  software dependencies in a consistent, reproducible manner. Docker guarantees the user experience will be identical to that shipped by the developer and eliminates installation inconsistencies.

These characteristics of Docker allow us to create complex software bundles and focus on the explanation of how they work, demonstrate the in-built algorithms, and provide tutorials that can be reused on new problems. We think this opens many doors for teaching basic computational methods as well as documenting technical software.

# What have we here ?

This is a demonstration of how to bundle python software into a Docker image and provide a simple user interface in the form of a static website and live jupyter notebooks.



The static html is created from markdown using jekyll as this closely approximates the format used by the notebook's formatted cells







[This is a link](Example1.html) to another page
