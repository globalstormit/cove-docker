#!/bin/bash

# Uploading this image to Docker Hub makes it a lot easier to deploy on QNAP, Synology, and other NAS devices.

TAG=v2

sudo docker build -t cove-docker:${TAG} ./image
sudo docker tag cove-docker:${TAG} luke791/cove-docker:${TAG}
sudo docker push luke791/cove-docker:${TAG}

