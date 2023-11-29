#!/bin/bash

sudo docker build -t cove-docker:v1 ./image
sudo docker tag cove-docker:v1 luke791/cove-docker:v1
sudo docker push luke791/cove-docker:v1
