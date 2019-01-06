
# My VM Bootstrapper

Prefer Ubuntu with LXQT

## Step 1 Update the Base System repos and Clone this repo 

```shell
cd ~/
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git
git clone https://github.com/johnarok/dotfiles
mkdir ~/progx/ && mv dotfiles ~/progx/
cd ~/progx/dotfiles/onetime-setup
sudo ./system.sh
./user.sh
```

## Step 2 User tools

### ssh setup

```shell
ssh-keygen
sudo systemctl status sshd # verify running
sudo systemctl enable ssh.service # not sshd.service
```

### Edits for GIT customization change NIL values

```shell
git config --global user.email "NIL"
git config --global user.name "NIL"
```

### Edits for Profile customization change NIL values

```shell
vim ~/progx/dotfiles/profile-scripts/bashrcinit.sh
echo "source ~/progx/dotfiles/profile-scripts/bashrcinit.sh" >> ~/.bashrc
```

### GO IDE Setup on VSCode 

1) Search for extension "lukehoban.go" in vscode
2) Change go tools path in File -> Preferences

```shell
{
    "go.toolsGopath":"~/progx/goutil"
}
```
