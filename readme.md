
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
pacman -S htop wget base-devel git sudo i3-wm go i3status xorg-server xf86-video-intel xorg-xrandr ttf-roboto 
chromium firefox noto-fonts dmenu xorg-fonts-encodings ttf-droid ttf-dejavu ttf-crosore ttf-bitstream-vera 
xorg-fonts-alias font-bh-ttf dina-font artwiz-fonts tamsym-font terminus-font zsh tree powerline jdk10-openjdk 
openjdk10-doc  openjdk10-src jre8-openjdk  openjdk8-doc openjdk8-src  jdk-openjdk   openjdk-doc  openjdk-src 
xorg-xbacklight scrot feh vim vifm pulseaudio pasystray pavucontrol gscreenshot gimp pinta nodejs npm  
pacman-contrib 
```

##### add Sijmen user
```
groupadd sudo
useradd -m sijmen
chpasswd
```

##### Install packages from arch user repository
Run as user `sijmen`
```
mkdir /opt/yay
cd /opt/yay
sudo chown sijmen:root .
git clone https://aur.archlinux.org/yay.git .
makepkg -si

yay -S powerline-fonts-git i3-lock-fancy-rapid-git oh-my-zsh-git antigen-git jetbrains-toolbox
```

##### System things
```
ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

wget -O /tmp/mirrorlist https://www.archlinux.org/mirrorlist/?country=NL&protocol=https
# replace '#Server' with 'Server' in the tmp file
rankmirrors -n 6 /tmp/mirrorlist > /etc/pacman.d/mirrorlist
rm /tmp/mirrorlist
pacman -Sy

chsh -s /bin/zsh
```
