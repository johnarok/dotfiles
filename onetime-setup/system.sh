#!/bin/sh
set -euxo

lsb_release -a | grep Ubuntu
if [ $?  -eq 0 ];
then
    # Ubuntu
    # Upgrade System

    apt update
    apt upgrade -y

    # Install Standard Utilities needed for Bootstrap

    apt-get install -y \
	            ssh \
                    git \
                    curl \
                    wget \
                    htop \
                    bash \
                    ca-certificates \
                    vim \
                    tmux \
                    neovim

    # Install C development tools 

    apt-get install -y \
	            build-essential \
		    gcc \
		    g++ \
		    make \
		    autoconf \
		    automake

    # Terminal Happiness

    apt-get install -y \
	            jq \
                    silversearcher-ag \
		    ethtool \
		    network-manager \
		    openssh-server \
		    gnupg \
		    dirmngr \
		    scrot \
		    feh
	    	    
    # Browser 

    apt-get install -y \
	    	    firefox

    # Docker
    ./system-docker.sh

    # VSCode
    ./system-vscode.sh

    # Python
    ./system-python3.sh

    # VMTools
    ./system-vmtools.sh

    # i3
    ./system-i3.sh

else
    # Fedora / centos
    echo "Not implemented for Fedora or Centos"

    # GCC Dev tools
    dnf install @"C Development Tools and Libraries" 

    # VSCode
    ./system-scode.sh

    # Set SELinux to permissive
    sudo setenforce 0 # Only on Fedora and Centos
fi


