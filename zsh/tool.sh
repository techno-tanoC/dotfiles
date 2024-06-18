# mise
eval "$(mise activate zsh)"
eval "$(mise completion zsh)"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:${PATH}"
rbenv() {
  unfunction "$0"
  eval "$(rbenv init -)"
  $0 "$@"
}

# direnv
eval "$(direnv hook zsh)"

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
helm() {
  unfunction "$0"
  source <(helm completion zsh)
  $0 "$@"
}

# aws
# https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-configure-completion.html
aws() {
  unfunction "$0"
  autoload bashcompinit && bashcompinit
  autoload -Uz compinit && compinit
  complete -C $(which aws_completer) aws
  $0 "$@"
}

# gcloud
# https://cloud.google.com/sdk/docs/downloads-versioned-archives?hl=ja#installation_instructions
gcloud() {
  unfunction "$0"
  source "$(mise where gcloud)/path.zsh.inc"
  source "$(mise where gcloud)/completion.zsh.inc"
  $0 "$@"
}
