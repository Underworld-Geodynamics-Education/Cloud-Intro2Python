#!/bin/sh

# Docker build command for the base python image
# Currently we are at version 1.05

# 1.05 includes the jupyter notebook extensions but not litho1pt0 and stripy


set -e
cd $(dirname "$0")/../..

docker build -t lmoresi/docker-cloud-python:v0.1.1 -f Docker/Kub-JHub/Dockerfile-jhub  .
