!#/usr/local/bin/bash

dir=~/oss/dotfiles
ln -sf $dir/.gitconfig ~
ln -sf $dir/.bash ~
ln -sf $dir/.bash_profile ~
source $dir/.bash_profile
ln -sf $dir/oss/dotfiles/.vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf $dir/.w3m/keymap ~/.w3m/
ln -sf $dir/.w3m/config ~/.w3m/
ln -sf $dir/.w3m/bookmarks.html ~/.w3m/
ln -sf $dir/.tmux.conf ~
