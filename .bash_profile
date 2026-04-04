#!/bin/bash
export PS1="\W ☂ "
if [[ -f ~/.profile ]]; then
  source ~/.profile
fi
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export EDITOR=vim

source ~/.bash/functions.sh
source ~/.bashrc
source ~/.bash/aliases
