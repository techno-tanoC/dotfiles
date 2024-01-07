#!/bin/sh

# git
mkdir -p ~/.config/git/
ln -sf ~/dotfiles/git/gitignore ~/.config/git/ignore
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig

# zsh
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

# vlc
ln -sf ~/dotfiles/vlc/vlcrc ~/.config/vlc/vlcrc
