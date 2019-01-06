#!/bin/bash
set -euxo

# gpg 
ln -s ~/progx/dotfiles/config-files/.gnupg/gpg.conf ~/.gnupg/
ln -s ~/progx/dotfiles/config-files/.gnupg/gpg-agent.conf ~/.gnupg/

# i3

# wget https://raw.githubusercontent.com/jessfraz/dotfiles/master/.i3/config
# wget https://raw.githubusercontent.com/jessfraz/dotfiles/master/.i3/status.conf

mkdir -p ~/.config/i3
ln -s ~/progx/dotfiles/config-files/.config/i3/config ~/.config/i3/config  
ln -s ~/progx/dotfiles/config-files/.config/i3/status.conf ~/.config/i3/status.conf # Disable some of the battery audio stuff 
ln -s ~/progx/dotfiles/config-files/.Xdefaults ~/.Xdefaults # Solarized Theme
echo "exec --no-startup-id /usr/bin/xrandr --output Virtual1 --mode 1920x1080" >> $HOME/.config/i3/config
echo "exec --no-startup-id /usr/bin/vmware-user-suid-wrapper" >> $HOME/.config/i3/config


# Desktop Setup

# apt-get install x11-apps
# apt-get install terminator
# apt-get install rxvt-unicode-256color # alt) lxterminal



