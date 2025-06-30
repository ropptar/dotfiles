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
crank dwmblocks

#monitor settings
xrandr --output HDMI-0 --mode 1920x1080
xrandr --output HDMI-1 --auto --same-as HDMI-0 --mode 1920x1080

#write pid
echo $$ > /tmp/dwm.pid

#persistent windows
while true; do
	dwm
done

rm /tmp/dwm.pid
