#!/bin/bash
# VSCode dotfiles install script

cat <<EOF >> ~/.bashrc
alias la="ls -alh"
alias ll="ls -al"

alias t="terraform"
alias tfmt="terraform fmt -recursive"

alias p="pulumi"
alias pu="pulumi up --refresh --diff"
alias pp="pulumi preview --refresh --diff"
alias pi="pulumi import --protect=false --yes"
EOF

mkdir -p ~/.config/git/
ln -sf ~/dotfiles/git/gitignore ~/.config/git/ignore
