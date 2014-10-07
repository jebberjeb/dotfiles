# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH=/usr/bin:$HOME/bin:/bin:/sbin:/usr/local/apache-maven-3.0.5/bin:/usr/local/bin
#export TERM=xterm-256color

# .git-prompt
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# git config
git config --global user.name "Jeb Beich"
git config --global user.email jebbeich@gmail.com

# default editor
export EDITOR=vim

# timezone
export TZ=America/Chicago
