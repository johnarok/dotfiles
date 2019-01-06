# SSH Setup

ssh-keygen
cp ~/progx/dotfiles/config-files/.ssh/config ~/.ssh/ # Fix for WSL ssh proxy via nc
systemctl enable sshd
systemctl start sshd

# Solarized Setting for Putty
wget https://raw.githubusercontent.com/altercation/solarized/master/putty-colors-solarized/solarized_dark.reg


