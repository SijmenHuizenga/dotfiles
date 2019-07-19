
In this repo you find my computer setup. It contains installation instructions, dotfiles, configuration things and custom scripts.

## Stack 
* Arch Linux
  * yay (aur package manager)
* i3 window manager
* Command line
  * zsh (terminal emulator)
  * antigen (zsh package manager)
  * oh-my-zsh (themes for zsh)
  * agnoster (zsh theme)
  * powerline-fonts (fancy fonts)
* File management
  * vifm (command line file browser)
  * udisks (manage removeable media)
  * ncdu (analyze disk usage)
  * pmount (mounting encrypted media)
* Image
  * feh Quick image viewer
  * scrot (quick screenshot)
  * gscreenshot (partial screenshot) 
  * gimp (photo editing)
* Audio
  * pulseaudio (audio manager)
  * pasystray (system tray)
  * pavucontrol (volume control)

## Installation

##### Install system packages
```
pacman -Suyy htop wget base-devel git sudo i3-wm go i3status xorg-server xf86-video-intel xorg-xrandr ttf-roboto chromium firefox noto-fonts dmenu xorg-fonts-encodings ttf-droid ttf-dejavu ttf-crosore ttf-bitstream-vera xorg-fonts-alias font-bh-ttf dina-font artwiz-fonts tamsym-font terminus-font zsh tree powerline jdk10-openjdk openjdk10-doc  openjdk10-src jre8-openjdk  openjdk8-doc openjdk8-src  jdk-openjdk   openjdk-doc  openjdk-src xorg-xbacklight scrot feh vim vifm pulseaudio pasystray pavucontrol gscreenshot gimp pinta nodejs npm pacman-contrib vlc numlockx ncdu keybase keybase-gui kbfs rsync openssh docker tar zip dnsutils nfs-utils ripgrep
```

##### add Sijmen user
```
useradd -m sijmen
chpasswd sijmen
```

##### Setup sudo 
```
groupadd sudo
usermod -a -G sudo sijmen
usermod -a -G docker sijmen
nano /etc/sudoers

# Add to allow members of group sudo to exec any commmand
%sudo   ALL=(ALL) ALL

# Add to allow sijmen run sudo without password
sijmen ALL=(ALL) NOPASSWD: ALL

# Disable root login
passwd -l root
```

##### Install packages from arch user repository
Run as user `sijmen`
```
mkdir /opt/yay
cd /opt/yay
sudo chown sijmen:root .
git clone https://aur.archlinux.org/yay.git .
makepkg -si

yay -S powerline-fonts-git i3-lock-fancy-rapid-git oh-my-zsh-git antigen-git jetbrains-toolbox udevil-git pmount direnv
```

##### System things
```
ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
sudo hwclock --systohc

wget -O /tmp/mirrorlist https://www.archlinux.org/mirrorlist/?country=NL&protocol=https
# replace '#Server' with 'Server' in the tmp file
rankmirrors -n 6 /tmp/mirrorlist > /etc/pacman.d/mirrorlist
rm /tmp/mirrorlist
pacman -Sy

chsh -s /bin/zsh sijmen

nano /etc/locale.gen
# uncomment #en_US.UTF-8 UTF-8
locale-gen
```

##### Auto Login
```
sudo mkdir /etc/systemd/system/getty@tty1.service.d/
sudo nano /etc/systemd/system/getty@tty1.service.d/override.conf
```
Add the following:
```
[Service]
Type=simple
ExecStart=
ExecStart=-/usr/bin/agetty --autologin sijmen --noclear %I $TERM
```
Now just restart and you should be logged in automagicly

##### Keys setup
```
keybase login
systemctl start --user keybase
systemctl enable --user keybase
mkdir ~/.secrets
keybase config set mountdir /home/sijmen/.secrets
systemctl start --user kbfs
systemctl enable --user kbfs

./sync-keys.sh
```

##### VPN Setup

**wolkje** 
0. Generate client file on vpn server using `pivpn add nopass` and user the devices hostname as client name
1. Download file from vpn server /home/sijmen/ovpns/xxx.ovpn to `~/.secrets/private/sijmenhuizenga/wolkje-vpn/hostname.ovpn`
2. Install client (`sudo pacman -S openvpn`)
3. Install dns setup thingy (`yay -S openvpn-update-resolv-conf-git`)
4. Add the following lines to the ovpn file if you want dns support:
````
script-security 2
dhcp-option DNS 10.11.12.1
up /etc/openvpn/update-resolv-conf
down /etc/openvpn/update-resolv-conf
````
5. Run wolkje-vpn
