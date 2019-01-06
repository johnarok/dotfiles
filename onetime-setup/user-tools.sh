#!/bin/bash
set -euxo
# Other Github OSS
source ~/progx/dotfiles/profile-scripts/bashrcinit.sh
source ~/progx/dotfiles/profile-scripts/common-install-helpers.sh

# Binaries from Github

__install_url2bin semver \
	https://raw.githubusercontent.com/fsaintjacques/semver-tool/master/src/semver
__install_url2bin powerline-go \
	https://github.com/justjanne/powerline-go/releases/download/v1.11.0/powerline-go-linux-amd64
__install_url2bin wuzz \
	https://github.com/asciimoo/wuzz/releases/download/v0.4.0/wuzz_linux_amd64
__install_url2bin kubectl \
	https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
__install_url2bin pony \
	https://github.com/jessfraz/pony/releases/download/v0.2.4/pony-linux-amd64

# Compressed Binaries from Github

__install_url2bintargz oc \
	https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz

# Go Binaries

__install_go2bin cfssl \
	github.com/cloudflare/cfssl/cmd/cfssl  
__install_go2bin cfssljson \
	github.com/cloudflare/cfssl/cmd/cfssljson  

# GIT Clones

__install_repo2path https://github.com/junegunn/fzf.git ~/.fzf 


