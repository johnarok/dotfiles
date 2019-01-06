#!/bin/bash
set -euxo
source ~/progx/dotfiles/profile-scripts/bashrcinit.sh

# Create directories

mkdir -p $GO3P
mkdir -p $GOWORK
mkdir -p $GOROOT
mkdir -p $GOUTIL
mkdir -p $GOWORK/src/github.com
mkdir -p $GOWORK/src/gitlab.com

# Install Golang

GO_VERSION=$(curl -sSL "https://golang.org/VERSION?m=text")
GO_VERSION=${GO_VERSION#go}
curl -sSL https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz --insecure | tar -v -C ~/progx -xz

