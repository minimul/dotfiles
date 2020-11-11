set -o vi
#stty start undef stop undef

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
