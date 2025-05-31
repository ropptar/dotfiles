
if [ ${ZSH_VERSION} ]; then
	git_status() {
		git status > /dev/null 2>&1 && echo "$1$(git branch --show-current)$2 "
	}
	precmd() {
		local LEFT="%F{blue}%n%(!. !.)%f @ %F{red}%m$([ -n "$SSH_CLIENT" ] && echo " !")%f"
		local LEFTB="in %B%F{green}%~%f%b $(git_status "at %B%F{yellow}" "%f%b")%(!.#.%%) "
		local RIGHTB="%(?..%F{red}%?%f)"
		
		PROMPT=$LEFT$'\n'$LEFTB
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
