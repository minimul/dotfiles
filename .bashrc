set -o vi
#stty start undef stop undef

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
