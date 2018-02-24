zgen() {
	source /usr/share/zgen/zgen.zsh
	zgen "$@"
}
  
if [[ ! -s ${ZDOTDIR:-${HOME}}/.zgen/init.zsh ]]; then
    zgen load lukechilds/zsh-nvm
    zgen prezto prompt theme 'sorin'
    zgen prezto editor key-bindings 'vi'
    zgen prezto utility:ls color 'yes'
    zgen prezto '*:*' color 'yes'
    zgen prezto
    zgen prezto git
    zgen prezto ssh
    zgen prezto syntax-highlighting
    zgen prezto editor
    zgen save
    zcompile ${ZDOTDIR:-${HOME}}/.zgen/init.zsh
fi

export NVM_LAZY_LOAD=true
source ${ZDOTDIR:-${HOME}}/.zgen/init.zsh

export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$GOPATH/bin:$GOROOT/bin:$PATH"
export EDITOR="nvim"

if [[ -d /mnt/secrets ]]; then
    HISTFILE=/mnt/secrets/.zhistory
fi

eval "$(direnv hook zsh)"

eval "$(jump shell)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
