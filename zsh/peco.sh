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
