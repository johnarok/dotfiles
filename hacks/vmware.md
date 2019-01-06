# Uninstall old tools (from h4hacks.com)

/usr/bin/vmware-uninstall-tools.pl
/opt/VBOXGuestAdditions-5.0.16/uninstall.sh
sudo aptitude purge virtualbox-guest-x11 virtualbox-dbg virtualbox-dkms
rm-rf /etc/vmwaretools

# Install new tools

apt-get install open-vm-tools open-vm-tools-desktop fuse

# Add fuse autostarts

vim /etc/rc.local
sudo mkdir /var/run/vmblock-fuse
sudo su -l -c "vmware-block-fuse -osubtype-vmware-vmblock,default_permissions,allow_other /var/run/vmblock-fuse"

# Add copy-paste autostarts

vim /root/.config/autostart/copypaste-autostart.desktop
[Desktop Entry]
Type=Application
Name=copypaste start
Comment=Start copy paste and drag n drop for vm tools
Exec=/progx/dotfiles/profile-scripts/cpaste.sh
#OnlyShowIn=LXDE

# works in vmware and included in above script

sudo chmod u+s /usr/bin/vmware-user-suid-wrapper
/usr/bin/vmware-user-suid-wrapper

# works in vmware (works in fedora)

#/usr/bin/vmtoolsd -n vmusr
echo "exec /usr/bin/vmtoolsd -n vmusr &" > $HOME/.config/i3/config
echo "Info! i3 Config changed to include vmtoolsd, check if clipboard is working"

# also works in vmware (alternate)

echo "exec /usr/lib/vmware-tools/sbin64/vmtoolsd -n vmusr -blockFd 3 &" > $HOME/.config/i3/config
echo "Info! i3 Config changed to include vmtoolsd, check if clipboard is working"

# some toubleshooting tips

# reference ps -ef after running suid-wrapper

#root        264      2  0 Apr06 ?        00:00:00 [irq/16-vmwgfx]
#root        356      1  0 Apr06 ?        00:00:00 vmware-vmblock-fuse /run/vmblock-fuse -o rw,subtype=vmware-vmblock,default_permissions,allow_other,dev,suid
#root        414      1  0 Apr06 ?        00:09:13 /usr/bin/vmtoolsd
#user01    52887      1  1 12:13 pts/1    00:00:11 /usr/bin/vmtoolsd -n vmusr --blockFd 3

# 1/5/2019

echo "exec --no-startup-id /usr/bin/xrandr --output Virtual1 --mode 1440x900" >> $HOME/.config/i3/config
echo "exec --no-startup-id /usr/bin/vmware-user" >> $HOME/.config/i3/config

# if copy-paste is not working, check if below processes are running.

root        194      2  0 14:59 ?        00:00:00 [irq/16-vmwgfx]
root        364      1  0 14:59 ?        00:00:00 /sbin/lvmetad -f
root        377      1  0 14:59 ?        00:00:00 vmware-vmblock-fuse /run/vmblock-fuse -o rw,subtype=vmware-vmblock,default_permissions,allow_other,dev,suid
root        380      1  0 14:59 ?        00:00:01 /usr/bin/vmtoolsd
user01     1101      1  0 15:01 pts/0    00:00:01 /usr/bin/vmtoolsd -n vmusr --blockFd 3

# if not run /usr/bin/vmware-user once


