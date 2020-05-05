#!/bin/bash
export PS1="\W ☂  "
source ~/.profile # Get the paths
source ~/.bash/functions
source ~/.bashrc
source ~/.bash/aliases

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
