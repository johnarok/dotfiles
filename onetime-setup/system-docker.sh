#!/bin/bash
set -euxo
# Docker Setup
lsb_release -a | grep Ubuntu
if [ $?  -eq 0 ];
then
    VERSION=18.06.*
    RELEASE=bionic
    CHANNEL=stable
    #RELEASE=$(lsb_release -cs)
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $RELEASE \
    $CHANNEL"
    apt-get update
    #apt-cache madison docker-ce
    apt-get install -y docker-ce=$VERSION
    usermod -aG docker user01
    systemctl enable docker.service
    systemctl start docker.service
else
    # Fedora / centos
    echo "Not implemented for Fedora or Centos"
fi
