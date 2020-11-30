#!/bin/bash

if [ $(cat /etc/hostname) = lichtje ]; then
  if [ "$1" = "inc" ]; then
    /home/sijmen/dotfiles/xrandr-brightness-script/brightness.sh + eDP1 0.1 
  else
    /home/sijmen/dotfiles/xrandr-brightness-script/brightness.sh - eDP1 0.1
  fi
else
  if [ "$1" = "inc" ]; then
    sudo xbacklight -inc 5
  else
    sudo xbacklight -dec 5
  fi

fi
