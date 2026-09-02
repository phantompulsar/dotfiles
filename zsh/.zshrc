# Env
export EDITOR="nvim"
export VISUAL="nvim"
export LANG="en_AU.UTF-8"
export LC_ALL="en_AU.UTF-8"

set -o vi
export KEYTIMEOUT=1

# Fix line annoyance 
_first_prompt=1
precmd() {
  if [[ $_first_prompt -eq 0 ]]; then
    print ""
  fi
  _first_prompt=0
}
clear() {
  command clear
  _first_prompt=1
}

# History
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE="$HOME/.zsh_history"

# Shell opt
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt AUTO_CD
setopt CORRECT
setopt EXTENDED_GLOB
setopt NO_BEEP

# Generic aliases
alias lg='lazygit'
alias nv='nvim'
alias ff='fastfetch'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

alias reload='source ~/.zshrc'

# Functions
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Auto-completion
autoload -U compinit && compinit

# Fzf-tab
source "/opt/homebrew/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh"

# Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(fzf --zsh)"

# Prompt Starship
eval "$(starship init zsh)"
eval "$(mise activate zsh)"

# Proton Pass Cli
export SSH_AUTH_SOCK="$HOME/.ssh/proton-pass-agent.sock"
