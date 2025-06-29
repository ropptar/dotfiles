# aliases
source ~/scripts/shell/aliases.sh

# enable colors
autoload -U colors && colors
LS_COLORS="di=00;34"
export LS_COLORS

# cache history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# completion
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

#formatting and colors
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt %SScrolling: %p%s
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33

#cache results
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "~/.cache/zsh/zcompcache"

#sort results in order
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:' group-order \
	aliases commands functions builtins

setopt AUTO_LIST

autoload -Uz compinit;compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'J' vi-forward-blank-word
bindkey -M menuselect 'K' vi-backward-blank-word

# cursor shape
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

# PS1
source ~/scripts/shell/prompt.sh

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# ssh agent
local ssh_agent_pid=/tmp/ssh-agent.pid
SSH_AUTH_SOCK=/tmp/ssh-agent.sock
if [ -z "$(pgrep ssh-agent)" ]; then
	eval $(ssh-agent -s -a $SSH_AUTH_SOCK) > /dev/null && echo "ssh-agent invoked: $SSH_AGENT_PID"
	ssh-add ~/.ssh/git_ed25519
fi
export SSH_AGENT_PID
export SSH_AUTH_SOCK

# plugins
source ~/.zsh/plugins/*/*.zsh
eval $(thefuck --alias)
