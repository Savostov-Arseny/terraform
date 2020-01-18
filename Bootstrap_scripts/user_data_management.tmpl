#!/bin/bash

#install docker-ce
sudo apt-get update

sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   bionic \
   stable"

sudo apt-get update

sudo apt-get -y install docker-ce
sudo usermod -aG docker ubuntu

#install docker-composse
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#Pull management tools repo
git clone https://github.com/Savostov-Arseny/management-tools.git
sudo mv /management-tools /home/ubuntu/management-tools/
sudo chown ubuntu:ubuntu /home/ubuntu/management-tools/ -R

#build container with Ansible, and transfer aws iam user keys.
sudo docker build --build-arg   buildtime_variable1=${access} --build-arg buildtime_variable2=${secret}  -t ansible /home/ubuntu/management-tools/Ansible
