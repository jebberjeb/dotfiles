# .bash_profile

echo "sourcing .bash_profile"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# This is just temporary, probably need to update the AMI
work
cd dmot
aws-local.sh
attach-ebs
cd ~
