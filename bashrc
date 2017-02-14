##############################################################################
#   Filename: .bashrc                                                        #
# Maintainer: Michael J. Smalley <michaeljsmalley@gmail.com>                 #
#        URL: http://github.com/michaeljsmalley/dotfiles                     #
#                                                                            #
#                                                                            #
# Sections:                                                                  #
#   01. General ................. General Bash behavior                      #
#   02. Aliases ................. Aliases                                    #
#   03. Theme/Colors ............ Colors, prompts, fonts, etc.               #
##############################################################################

##############################################################################
# 01. General                                                                #
##############################################################################
# Shell prompt
#export PS1="\n\[\e[0;36m\]┌─[\[\e[0m\]\[\e[1;33m\]\u\[\e[0m\]\[\e[1;36m\] @ \[\e[0m\]\[\e[1;33m\]\h\[\e[0m\]\[\e[0;36m\]]─[\[\e[0m\]\[\e[1;34m\]\w\[\e[0m\]\[\e[0;36m\]]\[\e[0;36m\]─[\[\e[0m\]\[\e[0;31m\]\t\[\e[0m\]\[\e[0;36m\]]\[\e[0m\]\n\[\e[0;36m\]└─[\[\e[0m\]\[\e[1;37m\]\$\[\e[0m\]\[\e[0;36m\]]› \[\e[0m\]"
source ~/dotfiles/bash_prompt
#source ~/.dockerrc

# If fortune is installed, run a fortune
if [ -e /opt/local/bin/fortune ]; then
    fortune -so
    echo " "
fi

export EDITOR='/usr/bin/vim'

##############################################################################
# 02. Aliases                                                                #
alias fuck='sudo $(history -p \!\!)'
alias docker-clean="docker rmi -f \$(docker images | grep -v REPOSITORY | awk '{print \$3}')"
alias run-tests='python -m unittest discover'
alias run-amazon-linux='docker run -it 137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest /bin/bash'
alias top='top -o cpu'
##############################################################################
# Enable colors in "ls" command output
alias ls="ls -Glah"

##############################################################################
# 03. Theme/Colors                                                           #
##############################################################################
# CLI Colors
export CLICOLOR=1
# Set "ls" colors
#export LSCOLORS=Gxfxcxdxbxegedabagacad
export LSCOLORS=dxfxcxdxbxegedabagacad

##############################################################################
# 04. PATH
##############################################################################
PATH=~/bin:$PATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

##############################################################################
# 05. Activate python virtualenv
##############################################################################

if [[ -a  ~/env/bin/activate ]]
  then
    . ~/env/bin/activate
fi

##############################################################################
# 06. Set go path
##############################################################################

if [[ -a ~/src/gostuff ]]
  then
    export GOPATH=$HOME/src/gostuff
fi

##############################################################################
# 07. aws autocomplete
##############################################################################
if [[ -a /Users/shart/env/bin/aws_completer ]]
  then
    complete -C '/Users/shart/env/bin/aws_completer' aws
fi

##############################################################################
# 08. rbenv
##############################################################################
eval "$(rbenv init -)"

##############################################################################
# 09. Virtualbox Shutdowns
##############################################################################

alias vboxstop="vagrant global-status | grep virtualbox | cut -c 1-9 | while read line; do echo $line; vagrant destroy $line; done;"

##############################################################################
# 10. Some auto-virtualenv stuff for python
##############################################################################
function cd {
    builtin cd "$@"
    if [ -d "venv" ] ; then
        source venv/bin/activate
    fi
}
