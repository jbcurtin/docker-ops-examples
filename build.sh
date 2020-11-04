#!/usr/bin/env bash

set -e

if [ ! -d "env" ]; then
    virtualenv -p $(which python) venv
fi
# Docker Hub
export IMAGE_REGISTRY_DOMAIN='jbcurtin'
# Custom Repository
# export IMAGE_REGISTRY_DOMAIN='registry.jbcurtin.io'
source venv/bin/activate
pip install -U pip
pip install -U docker-ops
docker login
docker-ops.py -s -d $PWD/images
