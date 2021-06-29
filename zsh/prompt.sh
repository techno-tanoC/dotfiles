# git ブランチ名を色付きで表示させるメソッド
function git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # git 管理されていないディレクトリは何も返さない
    echo " "
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全て commit されてクリーンな状態
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git 管理されていないファイルがある状態
    branch_status="%F{magenta}"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git add されていないファイルがある状態
    branch_status="%F{magenta}"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commit されていないファイルがある状態
    branch_status="%F{magenta}"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{red}!(no branch)"
    return
  else
    # 上記以外の状態の場合
    branch_status="%F{red}"
  fi
  # ブランチ名を色付きで表示する
  echo " ${branch_status}[$branch_name]%f "
}

setopt prompt_subst

re-prompt() {
    zle .reset-prompt
    zle .accept-line
}

# コマンド実行時にプロンプトを再表示
zle -N accept-line re-prompt

if [ -f "$HOME/bin/kube-ps1.sh" ]; then
  source "$HOME/bin/kube-ps1.sh"
fi
if [ -f "/opt/kube-ps1/kube-ps1.sh" ]; then
  source "/opt/kube-ps1/kube-ps1.sh"
fi
if [ -f "/usr/local/opt/kube-ps1/share/kube-ps1.sh" ]; then
  source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
fi

which kube_ps1 > /dev/null
if [ $? -eq 0 ]; then
  PROMPT='%D{%Y-%m-%d %H:%M:%S} $(git-current-branch)$(kube_ps1)
${SSH_TTY:+"%F{9}%n%f%F{7}@%f%F{3}%m%f "}%~${editor_info[keymap]} '
else
  PROMPT='%D{%Y-%m-%d %H:%M:%S} $(git-current-branch)
${SSH_TTY:+"%F{9}%n%f%F{7}@%f%F{3}%m%f "}%~${editor_info[keymap]} '
fi

RPROMPT=''
