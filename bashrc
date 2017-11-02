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
##### source ~/dotfiles/bash_prompt
function _update_ps1() {
    PS1="$(powerline-shell $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# If fortune is installed, run a fortune
if [ -e /opt/local/bin/fortune ]; then
    fortune -so
    echo " "
fi

export EDITOR='/usr/bin/vim'

HISTFILESIZE=10000000

##############################################################################
# 02. Aliases                                                                #
alias fuck='sudo $(history -p \!\!)'
alias docker-clean="docker rmi -f \$(docker images | grep -v REPOSITORY | awk '{print \$3}')"
alias kill-containers='docker stop $(docker ps -a -q)'
alias run-tests='python -m unittest discover'
alias run-amazon-linux='docker run -it 137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest /bin/bash'
alias top='top -o cpu'
alias chefdk='eval "$(chef shell-init bash)"'
alias pyautotest='ptw --spool 1000 --onpass "notify \"Tests Passed\" \"PyAutoTest\""  --onfail "notify \"Tests FAILED\" \"PyAutoTest\""'
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
export PATH="$PATH:./node_modules/.bin/" # add node modules to path

##############################################################################
# 05. Activate python virtualenv
##############################################################################

#if [[ -a  ~/env/bin/activate ]]
#  then
#    . ~/env/bin/activate
#fi

##############################################################################
# 06. Set go path
##############################################################################

if [[ -a ~/go ]]
  then
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
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

eval "$(direnv hook bash)"

##############################################################################
# 11. Set Groovy home
##############################################################################

export GROOVY_HOME=/usr/local/opt/groovy/libexec

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/shart/.sdkman"
[[ -s "/Users/shart/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/shart/.sdkman/bin/sdkman-init.sh"
