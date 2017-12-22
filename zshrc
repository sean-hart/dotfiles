# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/shart/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

### PIX Functions
function go_dev {
 export AWS_DEFAULT_REGION='us-east-1'
 export PIX_ENVIRONMENT=dev
 export AWS_DEFAULT_PROFILE=$PIX_ENVIRONMENT
 export AWS_PROFILE=$PIX_ENVIRONMENT
 export ORGANIZATION=pix2
 export ORGANIZATION_HOST=chef2.pxsys.net
 export ACTNUM=005196231456
}
function go_corp {
 export AWS_DEFAULT_REGION='us-west-2'
 export AWS_REGION='us-west-2'
 export PIX_ENVIRONMENT=corp
 export AWS_DEFAULT_PROFILE=$PIX_ENVIRONMENT
 export AWS_PROFILE=$PIX_ENVIRONMENT
 export ORGANIZATION=corpaws
 export ORGANIZATION_HOST=chef.pixsystem.net
 export ACTNUM=206520562826
}
function go_prod {
 export AWS_DEFAULT_REGION='us-west-2'
 export AWS_REGION='us-west-2'
 export PIX_ENVIRONMENT=prod
 export AWS_DEFAULT_PROFILE=$PIX_ENVIRONMENT
 export AWS_PROFILE=$PIX_ENVIRONMENT
 export ORGANIZATION=prodaws
 export ORGANIZATION_HOST=127.0.0.1:443
 export ACTNUM=578161345784
}
function go_home {
 export AWS_DEFAULT_REGION='us-west-2'
 export PIX_ENVIRONMENT=''
 export AWS_DEFAULT_PROFILE=home
 export AWS_PROFILE=home
 export ORGANIZATION=''
 export ORGANIZATION_HOST=''
 export ACTNUM=''
}

function go_sand {
 export AWS_DEFAULT_REGION='us-west-2'
 export AWS_DEFAULT_PROFILE=sandbox
 export AWS_PROFILE=sandbox
}

function go_devexp {
 export AWS_DEFAULT_REGION='us-west-2'
# export AWS_DEFAULT_PROFILE=devexp
 export AWS_DEFAULT_PROFILE=cnc
 export AWS_PROFILE=cnc
}

function what_env {
 echo "PIX: $PIX_ENVIRONMENT"
 echo "AWSCLI: $AWS_DEFAULT_PROFILE"
 echo "Knife EC2: $AWS_PROFILE"
 echo "Chef: $ORGANIZATION"
 echo "Chef Host: $ORGANIZATION_HOST"
 echo "AWS Account Number: $ACTNUM"
}

PATH="~/bin:$PATH"
export PATH



### Chef

alias chefdk='eval "$(chef shell-init zsh)"'

### Powerline
export PATH=$PATH:~/.direnv/./python-3.6.2/bin
. ~/.direnv/./python-3.6.2/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

eval "$(direnv hook $0)"
