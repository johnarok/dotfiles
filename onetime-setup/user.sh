#!/bin/bash
set -euxo

mkdir -p ~/Projects 
mkdir -p ~/progx/bin # Standard bin for user
mkdir -p ~/progx/jvm # Installing everything that requires a jvm to run..
mkdir -p ~/Downloads
mkdir -p ~/Desktop

rm -rf ~/Music ~/Pictures ~/Templates ~/Videos ~/Public ~/Documents 

./user-go.sh
./user-python.sh
./user-tools.sh

# Powerline Fonts (cannot install via apt see https://github.com/powerline/fonts/issues/281

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# symlinks
rm -rf ~/.config/terminator ~/.config/i3
ln -s ~/progx/dotfiles/config-files/terminator ~/.config/terminator
ln -s ~/progx/dotfiles/config-files/i3 ~/.config/i3

