#!/bin/bash
set -euxo
# VMWare/VirtualBox Guest Additions Setup
lsb_release -a | grep Ubuntu
if [ $?  -eq 0 ];
then
   lspci | grep -i vmware
   if [ $?  -eq 0 ];
   then
      apt-get install -y \
	              open-vm-tools \
		      open-vm-tools-desktop \
		      fuse
   else
      apt-get install -y \
	              virtualbox-guest-x11 
    
else
    # Fedora / centos
    echo "Not implemented for Fedora or Centos"
fi
