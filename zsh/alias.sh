alias rm="nocorrect rm"
alias la="ls -alh"
alias ll="ls -al"
alias lq="ls -Qm"
alias rgf="rg --files | rg"
function color {
  grep --color -E "$1|$" $2
}

alias openssl-connect="echo 'Q' | openssl s_client -connect"

# paccache -rk5: 5世代を残してキャッシュを消す
# paccache -ruk0: アンインストールされたものの全世代を消す
alias yay-upgrade="yay -Syu; paccache -rk5; paccache -ruk0"

function base64_from_stdin() {
  echo $1 | base64 -
}

function hash() {
  sha1sum $1 | awk '{ print $1 }'
}

function git-name-date-hash() {
  n=$(basename $(git rev-parse --show-toplevel))
  d=$(date '+%F')
  h=$(git log --pretty=format:'%h' | head -n 1)
  echo "${n}-${d}-${h}"
}

exists() { command -v "$1" > /dev/null; }

if ! exists open ; then
  alias open="xdg-open"
fi
if ! exists pbcopy ; then
  alias pbcopy="xsel --clipboard --input"
fi
if ! exists pbpaste ; then
  alias pbpaste="xsel --clipboard --output"
fi

function gcp-project() {
  projData=$(gcloud config configurations list | sed '1d' | peco)
  if echo "${projData}" | grep -E "^[a-zA-Z].*" > /dev/null ; then
    config=$(echo ${projData} | awk '{print $1}')
    gcloud config configurations activate ${config}
    # gcloud config configurations list | grep "${config}"
  fi
}


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
alias gaa="git add --all"
alias gc="git commit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias giff="git diff"
alias giffc="git diff --cached"
function gpo() { git push origin `git_current_branch` }
function gop() { git pull origin `git_current_branch` }
function gpfo() { git push --force origin `git_current_branch` }
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
alias dcr="docker-compose run --rm"
alias dcra="docker-compose run --rm app"
alias dce="docker-compose exec"
alias dcea="docker-compose exec app"
function dme() { eval $(docker-machine env $1) }
function dmu() { eval $(docker-machine env -u) }

# ruby
alias be="bundle exec"
alias bf="bundle exec foreman run"
alias biv="bundle install --jobs=4"

# k8s
alias k="kubectl"
alias kx="kubectx"
alias kn="kubens"
alias k-debug="k run -it debug --image=techno/nettool --rm --restart=Never -- ash"
alias kind-create="kind create cluster --config ~/k8s/cluster.yaml"
alias kind-delete="kind delete cluster"

# terraform
alias t="terraform"

# gcloud
alias g="gcloud"

# youtube-dl
function best-youtube() {
  youtube-dl --merge-output-format mp4 -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" $1
}
