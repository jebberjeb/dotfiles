# .bashrc<cr>

echo "sourcing .bashrc"

export DISPLAY=:1
export SOURCE_PATH=$HOME/efs/source
export SCRATCH_DIR=$HOME/efs/source/scratch
export SCRIPT_DIR=$HOME/efs/source/scripts
export APP_DIR=$HOME/ebs/source
export HISTSIZE=100000
export HISTTIMEFORMAT="%y-%m-%d %T "

# User specific aliases and functions
alias ll="ls -aFl"
alias tmux="TERM=screen-256color tmux"
alias vim="TERM=screen-256color vim"
alias s="source"
alias startx="startxfce4"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias work="cd work-scripts"

function bx() {
    if [[ -z $NICKSERV_PWD ]]; then
        echo 'must set NICKSERV_PWD'
    else
        BitchX
    fi
}

# irc
export IRCNICK=jebberjeb
export IRCSERVER=irc.freenode.net

if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi
if [ -f ~/.bashrc-git ]; then
    source ~/.bashrc-git
fi
if [ -f ~/.bashrc-path ]; then
    source ~/.bashrc-path
fi

set -o vi
export EDITOR=vim

# timezone
export TZ=America/Chicago

# ssh
ssh-reagent () {
  for agent in /tmp/ssh-*/agent.*; do
    export SSH_AUTH_SOCK=$agent
    if ssh-add -l 2>&1 > /dev/null; then
      echo Found working SSH Agent:
      ssh-add -l
      return
    fi
  done
  echo Cannot find ssh agent - maybe you should reconnect and forward it?
}

# CDPATH
export CDPATH=.:$SOURCE_PATH:$SCRATCH_DIR:$SCRIPT_DIR:$APP_DIR
