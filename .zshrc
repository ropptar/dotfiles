# ------DEBUG------
#zmodload zsh/zprof
# -----------------

# ------ZSH------
export PATH=$PATH:/opt/byedpi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
DISABLE_MAGIC_FUNCTIONS="true"
# ---------------

# ----PLUGINS----
plugins=(git
autoupdate
zsh-autosuggestions
zsh-syntax-highlighting
zsh-lazyload
you-should-use
copyfile
copybuffer
dirhistory
jsontools
)
source $ZSH/oh-my-zsh.sh
export EDITOR='nano'
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# ---------------

# -----VARS------
BOLD=$(tput bold)
BLUE=$(tput setaf 6)
NC=$(tput sgr0)
# ---------------

# -----FUNCS-----
function hist() { grep "$1" ~/.zsh_history ;}
function gcop() { git checkout $1; git pull ;}
function cat() { /bin/cat $*; printf "use ${BOLD}${BLUE}bat${NC} you dumbfuck\n"}
# ---------------

# ----ALIASES----
alias zshedit="${EDITOR} ~/.zshrc" 
alias zshreload="source ~/.zshrc"
# ---------------

# -----PYENV-----
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
# ---------------

# ------FZF------
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
_fzf_compgen_path() {
  pwd >> ~/test.txt;
  fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

source ~/scripts/fzf-git.sh
# ---------------

# ----THEFUCK----
eval $(thefuck --alias)
eval $(thefuck --alias FUCK)
# ---------------

# ------DEBUG------
#zprof
# -----------------
