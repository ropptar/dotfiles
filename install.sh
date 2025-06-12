#!/bin/bash

function linker() {
	last="${@: -1}"
	for path in "${@:1:$#-1}"; do
		ln -sf "$(realpath "$path")" "$last"
		echo "linked $path to $last"
	done
}

if [[ $(pwd) =~ "dotfiles" ]]; then
	linker .*rc scripts .zsh ~
	linker wallpapers ~/Pictures
	linker .config/* ~/.config
	linker scripts/startdwm.sh ~/.xinitrc

	doas cp -r etc/* /etc
	sudo chmod 0400 /etc/doas.conf

	doas cp usr/local/share/xsessions/dwm.desktop /usr/local/share/xsessions/dwm.desktop
else
	echo "wrong directory mate";
fi
