# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/nicksinclair/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_THEME="miloshadzic"
#ZSH_THEME="nebirhos"
#ZSH_THEME="norm"
## Uncomment the following line to use case-sensitive completion.
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
plugins=(git)

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

#ZSH_THEME=agnoster

plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting)

# Add env.sh
source ~/Projects/config/env.sh


#  .................    My Custom Things    .................  #

echo -e "\n\t😺  Ulimit> $(ulimit -u)"
echo -n "\t💣  Procs>"
ps aux | grep fsevent_watch | wc -l | sed -e 's@^\([^0-9]\)*@\1@g'
ps aux | grep fsevent_watch
echo 


# Git aliases
alias git_before_yesterday='git diff-tree --pretty="" --no-commit-id --name-only -r `git log -1 --pretty=format:"%h" --before="yesterday"` 2>/dev/null | sed -e "s/^/* /g" || echo "None"'
alias git_recently='git diff-tree --pretty="" --no-commit-id --name-only -r `git log -1 --pretty=format:"%h" --before="today"` 2>/dev/null | sed -e "s/^/* /g" || echo "None"'
alias git_recents_report='cat ./README.md | sed -e "2,\$d"; echo -e "\n### Recents\n"; git_before_yesterday'

# Navigation / exploring local directory structure and files
alias d='ls -d *'
alias d2='ls -d */*'
alias d3='ls -d */*/*'
alias t2='tree --noreport -L 2 -F; echo -e "\n$(lsaf)\n\n\t $(ppwd)\n"'
alias t3='tree --noreport -L 3 -F; echo -e "\n$(lsaf)\n\n\t $(ppwd)\n"'
alias t4='tree --noreport -L 4 -F; echo -e "\n$(lsaf)\n\n\t $(ppwd)\n"'
alias td2='tree --noreport -L 2 -d; echo -e "\n$(lsaf)\n\n\t $(ppwd)\n"'
alias td3='tree --noreport -L 3 -d; echo -e "\n$(lsaf)\n\n\t $(ppwd)\n"'
alias u2='CWD=`pwd`; cd ../; tree --noreport -L 3 -F; echo -e "\n  $(ppwd)"; echo -n "\n$(lsaf)\n\n"; cd ${CWD}; echo -e "\t $(ppwd)\n\n"'
alias u3='CWD=`pwd`; cd ../../; tree --noreport -L 4 -F; echo -e "\n  $(ppwd)"; echo -n "\n$(lsaf)\n\n"; cd ${CWD}; echo -e "\t $(ppwd)\n\n"'
alias u4='CWD=`pwd`; cd ../../../; tree --noreport -L 5 -F; echo -e "\n  $(ppwd)"; echo -n "\n$(lsaf)\n\n"; cd ${CWD}; echo -e "\t $(ppwd)\n\n"'
alias ud2='CWD=`pwd`; cd ../; tree --noreport -L 3 -d -F; echo -e "\n  $(ppwd)"; echo -n "\n$(lsaf)\n\n"; cd ${CWD}; echo -e "\t $(ppwd)\n\n"'
alias ud3='CWD=`pwd`; cd ../../; tree --noreport -L 4 -d -F; echo -e "\n  $(ppwd)"; echo -n "\n$(lsaf)\n\n"; cd ${CWD}; echo -e "\t $(ppwd)\n\n"'
alias ud4='CWD=`pwd`; cd ../../../; tree --noreport -L 5 -d -F; echo -e "\n  $(ppwd)"; echo -n "\n$(lsaf)\n\n"; cd ${CWD}; echo -e "\t $(ppwd)\n\n"'

alias list_commands='alias | egrep "ls\s|tree\s|ppwd" | egrep "^[a-z]{1,2}[0-9]?=" | sed -e "s/=.*$/ /g" | tr "\n" " " && echo'
alias listers='list_commands'

##

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH=$PATH:/usr/local/sbin

#export PATH=$PATH:/usr/local/opt/go/libexec/bin:~/go/bin


export GOPATH=$HOME/go
fpath=(/usr/local/share/zsh-completions $fpath)
