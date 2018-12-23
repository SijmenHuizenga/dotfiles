#!/bin/bash

cd ~/bin

convert -size 2000x2000 xc:black -font "DejaVu-Sans-Mono-Book" -pointsize 14 -fill white \
-annotate +20+20 @keys.txt -trim -bordercolor black -border 20 +repage keys.png

feh -x --no-menus --on-last-slide quit --title "cheat" keys.png

rm keys.png
