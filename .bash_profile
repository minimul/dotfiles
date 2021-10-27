#!/bin/bash
export PS1="\W ☂ "
if [[ -f ~/.profile ]]; then
  source ~/.profile
fi
source ~/.bash/functions
source ~/.bashrc
source ~/.bash/aliases
