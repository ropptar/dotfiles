#!/bin/sh

#setup wallpapers, kb layout etc.
feh --bg-fill ~/dotfiles/wallpapers/art/cardsharps.jpg
setxkbmap us,ru -option 'grp:win_space_toggle'
picom --backend=glx &

#autostart apps
librewolf &
telegram-desktop &
spotify &

#persistent windows
while true; do
	dwm
done
