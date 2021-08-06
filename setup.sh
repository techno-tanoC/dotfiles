#!/bin/sh

# git
mkdir -p ~/.config/git/
ln -sf ~/dotfiles/git/ignore ~/.config/git/ignore
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig

# zsh
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

# vim
mkdir -p ~/.vim

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/repos
rm installer.sh

ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/vim/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/vim/dein.toml ~/.vim/dein.toml
ln -sf ~/dotfiles/vim/dein_lazy.toml ~/.vim/dein_lazy.toml

# vlc
ln -sf ~/dotfiles/vlc/vlcrc ~/.config/vlc/vlcrc

# code
link_code() {
  if [ `uname` = "Darwin" ] ; then
    ln -sf ~/dotfiles/vscode/settings.json ~/Library/Application Support/Code/User/settings.json
  elif [ `lsb_release -is` = "ManjaroLinux" ] ; then
    ln -sf ~/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
    ln -sf ~/dotfiles/vscode/snippets ~/.config/Code/User/snippets
  elif [ `lsb_release -is` = "Ubuntu" ] ; then
    ln -sf ~/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
    ln -sf ~/dotfiles/vscode/snippets ~/.config/Code/User/snippets
  else
    echo "unsupported"
    exit 1
  fi
}

link_code

