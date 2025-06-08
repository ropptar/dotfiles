#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Functions
function sshp {
	ssh -t $1 "exec bash --rcfile <(cat /etc/bash.bashrc ~/.bashrc 2> /dev/null; printf '%s\n' $(printf %q "$(declare -p PROMPT_COMMAND)"))"
}

function seb {
	if [[ -n "$1" ]]; then
		sudo -E bash -ic "$@"
	else
		sudo -E bash
	fi
}

# Options
HISTSIZE= HISTFILESIZE=
set -o vi
shopt -s autocd

source ~/.config/shell/prompt.sh
