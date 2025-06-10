#!/bin/sh

#setup wallpapers, kb layout etc.
feh --bg-scale ~/dotfiles/wallpapers/art/cardsharps.jpg
setxkbmap us,ru -option 'grp:win_space_toggle'

#autostart apps
librewolf &
telegram-desktop &
spotify &

#persistent windows
while true; do
	dwm
done
