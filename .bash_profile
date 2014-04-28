# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# stuff created by ruby-build install.sh
export PATH=/usr/bin:$HOME/bin:/bin
#export TERM=xterm-256color

# .git-prompt
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# Additional path entries
export PATH=$PATH:~/idg/bin
