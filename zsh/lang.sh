# asdf
if [ -f $HOME/.asdf/asdf.sh ]; then
  . $HOME/.asdf/asdf.sh
fi
if [ -f $HOME/.asdf/completions/asdf.bash ]; then
  . $HOME/.asdf/completions/asdf.bash
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
alias biv="bundle install --path vendor/bundle --jobs=4"

# node
export PATH="./node_modules/.bin/:$PATH"
export PATH="$(npm bin -g 2> /dev/null)/:$PATH"

