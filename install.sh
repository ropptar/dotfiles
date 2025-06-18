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
	linker .config/* ~/.config/
	linker scripts/startdwm.sh ~/.xinitrc
	cp .gitconfig ~

	doas cp -r etc/* /etc
	doas chmod 0400 /etc/doas.conf

	doas cp usr/local/share/xsessions/dwm.desktop /usr/local/share/xsessions/dwm.desktop

	gsettings set org.gnome.desktop.interface font-name 'Hack Nerd Font 12'
	gsettings set org.gnome.desktop.interface monospace-font-name 'Hack Nerd Font Mono 12'
else
	echo "wrong directory mate";
fi
