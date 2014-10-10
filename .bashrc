# .bashrc<cr>

# Source global definitions
source /etc/bashrc

# User specific aliases and functions
alias ll="ls -aFl"
alias tmux="TERM=screen-256color tmux"
alias vim="TERM=screen-256color vim"
alias s="source"
alias startx="startxfce4"
set -o vi

alias gs="git status"
alias ga="git add"
alias gc="git commit"

# Add git info to the prompt
source ~/.git-prompt.sh
