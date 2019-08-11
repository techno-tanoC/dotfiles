#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# zmodload zsh/zprof && zprof

. /etc/profile.d/vte.sh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
unalias ll
alias rm="nocorrect rm"
alias la="ls -alh"
alias lq="ls -Qm"
alias open="xdg-open"
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

## enterをおした時にls & git status
function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    echo -e "\e[0;33m--- ls ---\e[0m"
    ls
    # ↓おすすめ
    # ls_abbrev
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status -sb
        echo "
        "
    fi
    zle reset-prompt
    return 0
}

zle -N do_enter
bindkey '^m' do_enter

# peco history
function peco-history-selection() {
    BUFFER=`history -n 1 | sort -k1,1nr | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# git
function git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

alias gi="git init"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias giff="git diff"
alias giffc="git diff --cached"
function gpo() { git push origin `git_current_branch` }
function gop() { git pull origin `git_current_branch` }
function gpfo() { git push -f origin `git_current_branch` }
function gpl() { git push gitlab `git_current_branch` }

# docker
alias di="docker images"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dr="docker run"
alias drm="docker rm"
alias drmi="docker rmi"
function drma() { docker rm `docker ps -aq` }
function drmia() { docker rmi `docker images -f "dangling=true" -q` }
alias dc="docker-compose"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# kube
alias kc="kubectl"
alias kx="kubectx"
alias kn="kubens"
kubectl() {
  unfunction "$0"
  source <(kubectl completion zsh)
  $0 "$@"
}
kubesec() {
  unfunction "$0"
  source <(kubesec completion zsh)
  $0 "$@"
}
helm() {
  unfunction "$0"
  source <(helm completion zsh)
  $0 "$@"
}

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:${PATH}"
rbenv() {
  unfunction "$0"
  eval "$(rbenv init -)"
  $0 "$@"
}

alias be="bundle exec"
alias bf="bundle exec foreman run"
alias biv="bundle install --path vendor/bundle --jobs=4"

# node
export PATH="./node_modules/.bin/:$PATH"
export PATH="$(npm bin -g 2> /dev/null)/:$PATH"

function best-youtube() {
  youtube-dl --merge-output-format mp4 -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" $1
}

# if (which zprof > /dev/null 2>&1) ;then
#   zprof | less
# fi
