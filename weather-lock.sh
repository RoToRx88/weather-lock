#!/usr/bin/env bash

# To generate background if lost: convert -size 1920x2160 xc:black background.png

if [ test $(find /tmp/lock.png -mmin +240) ] || [ ! -f /tmp/lock.png ]
then
  printf 'Generating files...'
  convert -size 1920x2160 xc:black /tmp/background_lock.png
  curl wttr.in/lyon.png --output /tmp/lyon.png
  curl wttr.in/moon.png --output /tmp/moon.png
  composite -gravity north /tmp/lyon.png /tmp/background_lock.png /tmp/lock.png
  composite -gravity south /tmp/moon.png /tmp/lock.png /tmp/lock.png
fi
i3lock -c 000000 -e -f -i /tmp/lock.png
