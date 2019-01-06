#!/bin/bash
set -euxo

lsb_release -a | grep Ubuntu
if [ $?  -eq 0 ];
then
    apt-get install -y \
	    	    python3 \
		    python3-pip \
		    python3-venv \
		    python-dev \
		    libssl-dev \
		    libffi-dev 

else
    # Fedora / centos
    echo "Not implemented for Fedora or Centos"
fi
