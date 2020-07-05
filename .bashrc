test -s ~/.alias && . ~/.alias || true

export EDITOR=nvim

#-------
# fzf
#-------
. /usr/share/bash-completion/completions/fzf
. /usr/share/bash-completion/completions/fzf-key-bindings


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
