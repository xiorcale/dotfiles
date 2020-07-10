test -s ~/.alias && . ~/.alias || true

export EDITOR=nvim

#-----
# fzf
#-----
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


#----------
# starship
#----------
eval "$(starship init bash)"

