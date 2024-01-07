#!/bin/sh

# git
mkdir -p ~/.config/git/
ln -sf ~/dotfiles/git/gitignore ~/.config/git/ignore
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig

# zsh
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

# vim
install_plugins() {
  curl https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim > ~/.vim/colors/molokai.vim
  git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
  git clone https://github.com/tomtom/tcomment_vim ~/.vim/pack/tml/start/tcomment_vim
  git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline
  git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine
}
install_plugins
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim/ideavimrc ~/.ideavimrc

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
