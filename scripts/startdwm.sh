#!/bin/sh

#setup wallpapers, kb layout etc.
feh --bg-fill ~/dotfiles/wallpapers/art/cardsharps.jpg
setxkbmap us,ru -option 'grp:win_space_toggle'
picom --backend=glx &

#autostart apps
function crank() {
	if [ -z "$(pgrep $1)" ]; then
		exec $1 &
	fi
}
crank librewolf
crank telegram-desktop
crank spotify

#write pid
echo $$ > /tmp/dwm.pid

#persistent windows
while true; do
	dwm
done

rm /tmp/dwm.pid
