# .bashrc<cr>

# User specific aliases and functions
alias ll="ls -aFl"
alias tmux="TERM=screen-256color tmux"
alias vim="TERM=screen-256color vim"
alias s="source"
alias startx="startxfce4"
alias gs="git status"
alias ga="git add"
alias gc="git commit"

source /etc/bashrc
source ~/.bashrc-git
source ~/.bashrc-path

set -o vi
export EDITOR=vim

# timezone
export TZ=America/Chicago

