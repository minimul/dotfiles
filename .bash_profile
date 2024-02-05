#!/bin/bash
export PS1="\W ☂ "
if [[ -f ~/.profile ]]; then
  source ~/.profile
fi
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

source ~/.bash/functions
source ~/.bashrc
source ~/.bash/aliases
