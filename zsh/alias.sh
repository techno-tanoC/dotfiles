alias rm="nocorrect rm"
alias la="ls -alh"
alias ll="ls -a"
alias lq="ls -Qm"

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

function best-youtube() {
  youtube-dl --merge-output-format mp4 -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" $1
}

