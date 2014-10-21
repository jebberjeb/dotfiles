# .bashrc<cr>

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

