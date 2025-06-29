#!/bin/sh
filepath=~/Pictures/screenshots/`date +%T_%d-%m-%Y`.png
if [ $XDG_SESSION_TYPE="x11" ]; then
	maim -sB | tee $filepath | xclip -selection clipboard -t image/png
	echo $filepath
else
	echo "will do wl later"
fi
