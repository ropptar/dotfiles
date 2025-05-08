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

# Aliases
alias c="clear"
alias rebash="source ~/dotfiles/.bashrc"
alias cen="cd /etc/nixos"

alias nrs="sudo nixos-rebuild switch"
alias nrsu="sudo nixos-rebuild switch --upgrade"
alias nrt="sudo nixos-rebuild test"

alias ls='ls --color=always'
alias grep='grep --color=always'
alias la="ls -lAh"
alias ll="ls -lh"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Options
HISTSIZE= HISTFILESIZE=
set -o vi
shopt -s autocd


# PS1
PROMPT_COMMAND='RED="\[\033[31m\]";
GRE="\[\033[32m\]";
YEL="\[\033[33m\]";
BLU="\[\033[34m\]"
PUR="\[\033[35m\]"
NC="\[\033[0m\]";

PROMPT_USER="󰀄";
PROMPT_ROOT="󱅞";
PROMPT_SSH="";
PROMPT_NIX="󱄅";

PS1_CMD1=$(git status &>/dev/null && echo "at ''${YEL}$(git branch --show-current)''${NC} ");
PS1_CMD2=$([[ "$EUID" = 0 ]] && echo " $PROMPT_ROOT!" || echo " $PROMPT_USER");
PS1_CMD3=$([[ -n "$SSH_CLIENT" ]] && echo " $PROMPT_SSH!");
PS1_CMD4=$([[ -n "$IN_NIX_SHELL" ]] && echo " | ${PUR}$PROMPT_NIX!${NC}");

PROMPT_BASE="\
${BLU}\u${PS1_CMD2}${NC} @ ${RED}\h${PS1_CMD3}${NC}${PS1_CMD4}\nin ${GRE}\w${NC} ${PS1_CMD1}\$ ";

PS1="$PROMPT_BASE"'

