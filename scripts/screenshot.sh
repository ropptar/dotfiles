#!/bin/sh
filepath=~/Pictures/screenshots/`date +%T_%d-%m-%Y`.png
if [ $XDG_SESSION_TYPE="x11" ]; then
	maim -sB | tee > $filepath | xclip -t image/png -selection clipboard
else
	echo "will do wl later"
fi
unset filepath
