#!/bin/bash

MYUSER="$(id -u):$(id -g)"

# Pull the image
docker pull soleo/latex

# Execute "build" in the image
docker run --rm -v `pwd`:/latex -u ${MYUSER} soleo/latex build $@
