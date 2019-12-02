#!/bin/bash

# update apt-get
export DEBIAN_FRONTEND="noninteractive"
sudo apt-get update

# remove previously installed Docker packages
sudo apt-get remove docker docker-engine docker.io* lxc-docker*

# install cert dependencies
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common

# add Docker repo gpg key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# add Docker repo
echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" >> /etc/apt/sources.list

# Update
sudo apt-get update

# install Docker package
sudo apt-get install docker-ce

# run hello-world app
sudo docker run hello-world

# manage Docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER

# configure Docker to start on boot
sudo systemctl enable docker
