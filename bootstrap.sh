dir=~/oss/dotfiles
ln -sf $dir/.gitconfig ~
ln -sf $dir/.global_gitignore ~
ln -sf $dir/.bash ~
ln -sf $dir/.bash_profile ~
source $dir/.bash_profile
ln -sf $dir/.vimrc ~
ln -sf $dir/.inputrc ~
ln -sf $dir/.irbrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.w3m
ln -sf $dir/.w3m/keymap ~/.w3m/
ln -sf $dir/.w3m/config ~/.w3m/
ln -sf $dir/.w3m/bookmark.html ~/.w3m/
ln -sf $dir/.tmux.conf ~
if [[ $(uname) ==  "Darwin" ]]; then
  ln -sf $dir/.bashrc-macos ~/.bashrc
else
  ln -sf $dir/.bashrc-ubuntu ~/.bashrc
fi
