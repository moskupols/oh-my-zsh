
_COLORS_PATH=$(dirname $(readlink -f $0))/dircolors.256dark

eval `dircolors $_COLORS_PATH`

# http://stackoverflow.com/questions/23555836/getting-zsh-to-honor-dircolors-solarized
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

