#!/bin/sh

# git
ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig

# zsh
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
# ln -s ~/dotfiles/zsh/ubuntu.zshrc ~/.zshrc

# vim
mkdir -p ~/.vim

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/repos
rm installer.sh

ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/dotfiles/vim/dein.toml ~/.vim/dein.toml
ln -s ~/dotfiles/vim/dein_lazy.toml ~/.vim/dein_lazy.toml

# vlc
ln -sf ~/dotfiles/vlc/vlcrc ~/.config/vlc/vlcrc
