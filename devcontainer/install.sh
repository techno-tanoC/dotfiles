#!/bin/bash
# VSCode dotfiles install script

cat <<EOF >> ~/.bashrc
alias la="ls -alh"
alias ll="ls -al"

alias t="terraform"
alias tim="terraform init -migrate-state"
alias tir="terraform init -reconfigure"
alias tp="terraform plan"
alias ta="terraform apply"
alias tfmt="terraform fmt -diff -recursive"
EOF

mkdir -p ~/.config/git/
ln -sf ~/dotfiles/git/gitignore ~/.config/git/ignore
