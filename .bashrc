# .bashrc<cr>

# Source global definitions
source /etc/bashrc

# User specific aliases and functions
alias ll="ls -aFl"
alias tmux="TERM=screen-256color tmux"
alias vim="TERM=screen-256color vim"
alias s="source"
alias startx="startxfce4"
alias gs="git status"
alias ga="git add"
alias gc="git commit"

export PATH=/usr/bin:$HOME/bin:/bin:/sbin:/usr/local/apache-maven-3.0.5/bin:/usr/local/bin

# Git prompt
source ~/.git-prompt.sh
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# Git config
git config --global user.name "Jeb Beich"
git config --global user.email jebbeich@gmail.com

set -o vi
export EDITOR=vim

# timezone
export TZ=America/Chicago

