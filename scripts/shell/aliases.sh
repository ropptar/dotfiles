alias c="clear"
alias v="nvim"
alias resh="source ~/.$(ps -p $$ -o 'comm=')rc"
local LSARGS="--color=always --group-directories-first"
alias ls="ls $LSARGS"
alias la="ls -lAh --color=always"
alias ll="ls -lh --color=always"
alias grep="grep --color=always"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

#git
alias g="git"
alias ga="git add"
alias gcl="git clone"

alias gb="git branch"
alias gbd="git branch -d"
alias gbD="git branch -D"

alias gc="git commit"
alias gcm="git commit -m"

alias gco="git checkout"
alias gcb="git checkout -b"

alias gst="git status"

alias gm="git merge"
alias gmt="git mergetool"
alias gdiff="git diff"

alias gl="git pull"
alias gp="git push"

alias grs="git restore"
alias grst="git restore --staged"

alias gsta="git stash"
alias gstap="git stash pop"

#stuff
alias mdwm="cd ~/github/dwm; doas make clean install"
