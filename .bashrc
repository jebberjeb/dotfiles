# .bashrc<cr>

export DISPLAY=:10
export SOURCE_PATH=$HOME/source
export SCRATCH_DIR=$HOME/source/scratch
export SCRIPT_DIR=$HOME/source/scripts
export APP_DIR=$HOME/source
export HISTSIZE=100000
export HISTTIMEFORMAT="%y-%m-%d %T "
# This should really be in aws config, right?
export AWS_DEFAULT_REGION=us-east-1

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

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
