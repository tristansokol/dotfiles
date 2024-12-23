
alias l="ls -Gal"
alias ls="ls -G"
alias ll="ls -Ghal"
alias empties="find . -empty -type d -maxdepth 2"

# networking
alias pg="ps ax | grep -v grep | grep -i "
alias ip="ifconfig | grep 'inet '"

#file management
alias df='df -h'
# Lists folders and files sizes in the current folder
alias ducks='du -cksh * | sort -rn|head -11'
alias f='find . -iname'
alias gr='grep -r' # Recursive grep
alias m='less'
alias systail='tail -f /var/log/system.log'
alias top='top -o cpu'
# Shows most used commands, from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$4}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"


# Git
alias ch="git diff --ignore-space-at-eol | $EDITOR"
alias chc="git diff --cached --ignore-space-at-eol | $EDITOR"
alias current_branch="git symbolic-ref HEAD | cut -d / -f 3"
alias gaa="git add --all && git status"
alias gadd="git add --all && git status"
alias gap="git add --patch"
alias gb='git branch -v'
alias gbr="git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname)' | cut -d / -f 3-"
alias gca='git commit -v --all'
alias gcam='git commit --amend'
alias gcb='git checkout -b'
alias gcf="git checkout -f"
alias gch="git log ORIG_HEAD.. --stat --no-merges"
alias gci='git commit -v'
alias gcia='git commit -v --all'
alias gclean="git clean -dff && git submodule foreach git clean -dff"
alias gcp="git checkout --patch"
alias gcv='git commit -v'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gdm='git diff origin/master'
alias gfd='git push -f origin head:canary'
alias git-user="$EDITOR ~/.gitconfig"
alias gl="git log --date=local"
alias gmm="git merge master"
alias gps="git pull && git submodule sync && git submodule update --init --recursive"
alias grc="git rebase --continue"
alias grim="git rebase --interactive master"
alias grm="git status | grep 'deleted:' | sed -e 's/^.*deleted: *//' -e 's/^/\"/g' -e 's/$/\"/g' | xargs -n1 git rm"
alias gs='git status'
alias gss='git status --short --branch'
alias gu="$EDITOR ~/.gitconfig"
alias gum="echo 'Resetting master to the latest origin/master...' && git fetch && git update-ref refs/heads/master origin/master"
alias grum="gum && git rebase master"
alias ungreen="git log --abbrev-commit --reverse --pretty=format:'%C(yellow)%h%Creset %C(bold)%s%Creset %an' origin/ci-master-distributed-latest..origin/master"

# OS-X Specific
alias lockscreen='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'

function gco {
  if [[ $# == 0 ]]; then
    git checkout master
  else
    git checkout "$@"
  fi
}


function get-free-disk-space() {
  df -k / | tail -n 1 | awk '{ print $4 }'
}

function as-gb() {
  read num
  echo $(echo "scale=2;$num/1048576" | bc)Gi
}

alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups

# run this function to reclaim disk space
function clean-logs() {
  before=$(get-free-disk-space)
  set -x
  /bin/rm -f ~/Development/web/log/*.log
  /bin/rm -f ~/Development/log/development/*
  /bin/rm -f ~/Development/log/*
  /bin/rm -f ~/Development/jumbotron/log/*
  /bin/rm -f /usr/local/var/log/nginx/*.log
  set +x
  after=$(get-free-disk-space)
  diff=$(echo $(expr $before - $after) | as-gb)
  echo "Cleaned up $diff"
}
