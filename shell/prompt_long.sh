if [ ${ZSH_VERSION} ]; then
	function length() {
		local -i x y=${#1} m
		if (( y )); then
			while (( ${${(%):-$1%$y(l.1.0)}[-1]} )); do
				x=y
				(( y*=2 ))
			done
			while (( y > x+1 )); do
				(( m = x + (y - x) / 2 ))
				(( ${${(%):-$1%$m(l.x.y)}[-1]} = m ))
			done
		fi
		typeset -g REPLY=$x
	}

	fill() {
		length $1
		local -i left=REPLY
		length $2 9999
		local -i right=REPLY
		local -i padl=$((COLUMNS - left - right-len))
		if (( padl < 1 )); then
			typeset -g REPLY=$1
		else
			local pad=${(pl.$padl.. -.)}
			typeset -g REPLY=${1}${pad}${2}
		fi
	}
	precmd() {
		local LEFT="%F{blue}%n%(!.!.)%f @ %F{red}%m%f"
		local RIGHT="%*"
		local LEFTB="in %B%F{green}%~%f%b $(git status 2&>1 >/dev/null && echo "at %B%F{yellow}$(git branch --show-current)%f%b ")> "
		local RIGHTB="%F{%(?.green.red)}%?%f"
		
		local REPLY
		fill "$LEFT" "$RIGHT"
		PROMPT=$REPLY$'\n'$LEFTB
		RPROMPT=$RIGHTB
	}   
elif [ ${BASH_VERSION} ]; then
	PS1='='
fi
