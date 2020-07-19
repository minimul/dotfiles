#!/bin/bash
export PS1="\W ☂  "
source ~/.profile # Get the paths
source ~/.bash/functions
source ~/.bashrc
source ~/.bash/aliases

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
