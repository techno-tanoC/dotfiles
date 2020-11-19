#!/bin/sh

# git
mkdir -p ~/.config/git/
ln -s ~/dotfiles/git/ignore ~/.config/git/ignore
ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig

# zsh
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

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

# code
link_code() {
  if [ `uname` = "Darwin" ] ; then
    ln -s ~/dotfiles/vscode/settings.json ~/Library/Application Support/Code/User/settings.json
  elif [ `lsb_release -is` = "ManjaroLinux" ] ; then
    ln -s ~/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
    ln -s ~/dotfiles/vscode/snippets ~/.config/Code/User/snippets
  elif [ `lsb_release -is` = "Ubuntu" ] ; then
    ln -s ~/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
    ln -s ~/dotfiles/vscode/snippets ~/.config/Code/User/snippets
  else
    echo "unsupported"
    exit 1
  fi
}

link_code

