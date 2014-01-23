#!/bin/bash
export PS1="\W ☂  "
source ~/.profile # Get the paths
source ~/.bash/functions
source ~/.bashrc
source ~/.bash/aliases


# MacPorts Installer addition on 2012-02-10_at_17:59:00: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
