autoload -Uz compinit && compinit

# Prompt style, when the hostname is set to arch.arkanelinux it will load a custom promp style,
# this is useful to quickly visually identify containerized shell instances
if [[ ! $HOSTNAME == 'arch.arkanelinux' ]]; then
	PS1='%(?..[%F{136}%?%f] )%n%f@%F{136}%m%f %1~ %#> '
else
	PS1='⬢ %(?..[%F{136}%?%f] )%n%f@%F{35}%m%f %1~ %#> '
fi

# Zsh history location and settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# ctrl + left/right word forwards/backwards
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# shift + tab for reverse tab-completion
bindkey '^[[Z' reverse-menu-complete

# Show selection on tab completion
zstyle ':completion:*' menu select

# Custom chars which define beginning or end of words
WORDCHARS=${WORDCHARS/\/}

# Zsh autosuggestions and syntax highlighting plugins
[[ -f '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' ]] &&
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -f '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' ]] &&
	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use colors for ls
alias ls='ls --color=auto'

alias archbox='distrobox enter arch'
