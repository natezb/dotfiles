# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_dups
setopt autocd
unsetopt beep
bindkey -v
bindkey "^?" backward-delete-char
bindkey "^H" backward-delete-char
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nate-arch/.zshrc'

alias ls='ls --color=auto'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR="vim"

# Set VIMODE according to the current mode (default [i])
function zle-keymap-select {
    VIMODE="${${KEYMAP/vicmd/[CMD]}/(main|viins)/[INS]}"
    zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
    VIMODE="[INS]"
}
#zle -N zle-line-finish

autoload -U colors && colors
PROMPT="%{$fg[green]%}[%n %~]\$%{$reset_color%} "
