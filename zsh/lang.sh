# asdf
if [ -f $HOME/.asdf/asdf.sh ]; then
  . $HOME/.asdf/asdf.sh
fi
if [ -f $HOME/.asdf/completions/asdf.bash ]; then
  . $HOME/.asdf/completions/asdf.bash
fi

# ruby
alias be="bundle exec"
alias bf="bundle exec foreman run"
alias biv="bundle install --jobs=4"

# node
export PATH="./node_modules/.bin/:$PATH"
export PATH="$(npm bin -g 2> /dev/null)/:$PATH"

