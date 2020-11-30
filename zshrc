# Explicitly configured $PATH variable
PATH=/usr/local/git/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/local/bin:/opt/local/sbin:/usr/X11/bin

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="xiong-chiamiov-plus"
ZSH_THEME="bullet-train"
BULLETTRAIN_PROMPT_ORDER=(
	status
	dir
	virtualenv
	git
	cmd_exec_time
)
BULLETTRAIN_VIRTUALENV_BG=black


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew repo sudo knife vagrant bundler web-search)

source $ZSH/oh-my-zsh.sh

# Put any proprietary or private functions/values in ~/.private, and this will source them
if [ -f $HOME/.private ]; then
  source $HOME/.private
fi

if [ -f $HOME/.profile ]; then
  source $HOME/.profile  # Read Mac .profile, if present.
fi

# Shell Aliases
## Git Aliases
#alias gs='git status '
#alias ga='git add '
#alias gb='git branch '
#alias gc='git commit'
#alias gd='git diff'
#alias go='git checkout '
#alias gk='gitk --all&'
#alias gx='gitx --all'
#alias got='git '
#alias get='git '

## Vagrant Aliases
#alias vag='vagrant'
#alias vagup='vagrant up'
#alias vagdestroy='vagrant destroy'
#alias vagssh='vagrant ssh'
#alias vaghalt='vagrant halt'

## Miscellaneous Aliases
#alias htop='sudo htop'

# Shell Functions
# qfind - used to quickly find files that contain a string in a directory
qfind () {
  find . -exec grep -l -s $1 {} \;
  return 0
}

# Custom exports
## Set EDITOR to /usr/bin/vim if Vim is installed
if [ -f /usr/bin/vim ]; then
  export EDITOR=/usr/bin/vim
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/shart/.sdkman"
[[ -s "/Users/shart/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/shart/.sdkman/bin/sdkman-init.sh"
export OKTA_USER=sean.hart@getcruise.com
export SSH_KEY=/Users/sean.hart/.ssh/id_rsa
export PATH=$PATH:/Users/sean.hart/Library/Python/2.7/bin



#. /usr/local/opt/asdf/asdf.sh

#. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source /Users/sean.hart/Library/Python/2.7/bin/aws_zsh_completer.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/completion.zsh.inc'; fi

export VAULT_ADDR=https://vault.secure.car:8200

# alias vault-login='vault login -method=okta username=sean.hart passcode=$1'
func vault-login(){
	local yubi
	if ((${+1})); then
		vault login -method=okta username=$USER passcode=$1
	else
		vared -p 'Please activate your Yubi key: ' -c yubi
		vault login -method=okta username=$USER passcode=$yubi
	fi
}

#alias aws-login='aws-portal-cli --second-factor duo:push --username sean.hart --force'
alias aws-login=aws-portal-cli

export ATLAS_TOKEN='***REMOVED***'

#export GOOGLE_APPLICATION_CREDENTIALS=/Users/sean.hart/.config/gcloud/application_default_credentials.json

export PATH=/usr/local/go/bin:$PATH

export PYTHONDONTWRITEBYTECODE=1


# Git shortcuts
alias git-remove-branches="git checkout master && git fetch --all && git rebase && git branch | grep -v "master" | xargs git branch -D"

GOPRIVATE=github.robot.car/cruise

func erg() {
	echo "stuff:${1}"
}

eval "$(direnv hook zsh)"

