#!/bin/sh

mkdir ~/.vim

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/repos

ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/dotfiles/vim/dein.toml ~/.vim/dein.toml
ln -s ~/dotfiles/vim/dein_lazy.toml ~/.vim/dein_lazy.toml
