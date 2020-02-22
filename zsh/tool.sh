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
function drmva() { docker volume rm `docker volume ls -qf "dangling=true"` }
alias dc="docker-compose"
alias dcra="docker-compose run --rm app"
alias dcea="docker-compose exec app"

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

