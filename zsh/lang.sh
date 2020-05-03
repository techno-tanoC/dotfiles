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

alias be="bundle exec"
alias bf="bundle exec foreman run"
alias biv="bundle install --jobs=4"

# node
export PATH="$(npm bin -g 2> /dev/null)/:$PATH"
