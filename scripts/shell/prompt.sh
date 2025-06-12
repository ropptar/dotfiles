if [ ${ZSH_VERSION} ]; then
	local git_status() {
		git status > /dev/null 2>&1 && echo "$1$(git branch --show-current)$2"
	}
	precmd() {
		PROMPT="%B%F{red}[%f%F{yellow}%n%F{green}@%f%F{blue}%m%f:%F{magenta}%~%f%F{red}]%f%b-$(git_status "%B%F{red}[%f%F{yellow}" "%f%F{red}]%f%b-")%B%F{red}[%f%*%F{red}]%f%b"\
$'\n'"$ "
		RPROMPT=$RIGHTB
	}   
elif [ ${BASH_VERSION} ]; then
	RED=$(tput setaf 1)
	GRE=$(tput setaf 2)
	YEL=$(tput setaf 3)
	BLU=$(tput setaf 4)
	BOL=$(tput bold)
	NC=$(tput sgr0)
	PROMPT_COMMAND='PS1_CMD1=$(git status >/dev/null 2>&1 && echo "at ${YEL}${BOL}$(git branch --show-current)${NC} ")'
	PS1='${BLU}\u${NC} @ ${RED}\H${NC}\n${GRE}${BOL}\w${NC} ${YEL}${PS1_CMD1}${NC}\$ '
fi
