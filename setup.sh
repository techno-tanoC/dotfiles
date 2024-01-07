#!/bin/sh

# git
mkdir -p ~/.config/git/
ln -sf ~/dotfiles/git/gitignore ~/.config/git/ignore
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig

# zsh
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

# vlc
ln -sf ~/dotfiles/vlc/vlcrc ~/.config/vlc/vlcrc

# code
link_code() {
  if [ `uname` = "Darwin" ] ; then
    ln -sf ~/dotfiles/code/settings.json ~/Library/Application\ Support/Code/User/settings.json
  elif [ `uname` = "Linux" ] ; then
    ln -sf ~/dotfiles/code/settings.json ~/.config/Code/User/settings.json
  else
    echo "unsupported"
    exit 1
  fi
}
link_code
