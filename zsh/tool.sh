# asdf
if [ -f $HOME/.asdf/asdf.sh ]; then
  . $HOME/.asdf/asdf.sh
  # append completions to fpath
  fpath=(${ASDF_DIR}/completions $fpath)
  # initialise completions with ZSH's compinit
  autoload -Uz compinit
  compinit
fi

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:${PATH}"
rbenv() {
  unfunction "$0"
  eval "$(rbenv init -)"
  $0 "$@"
}

# docker
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
export BUILDKIT_PROGRESS=plain

# k8s
kubectl() {
  unfunction "$0"
  source <(kubectl completion zsh | sed '/"-f"/d')
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

# aws
# https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-configure-completion.html
autoload bashcompinit && bashcompinit
complete -C $(which aws_completer) aws

# gcloud
source "$(asdf where gcloud)/path.zsh.inc"
source "$(asdf where gcloud)/completion.zsh.inc"

# node
export PATH="$(npm bin -g 2> /dev/null)/:$PATH"

# go
# https://zenn.dev/tennashi/articles/3b87a8d924bc9c43573e
export GO111MODULE=on
export GOBIN=$HOME/bin/go
export GOMODCACHE=$HOME/.cache/go_mod
export PATH=$GOBIN:$PATH

# direnv
eval "$(direnv hook zsh)"
