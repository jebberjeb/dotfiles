# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export PATH=/usr/bin:$HOME/bin:/bin:/sbin
#export TERM=xterm-256color

# .git-prompt
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# Additional path entries
export PATH=$PATH:~/idg/bin
