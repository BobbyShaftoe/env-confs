#!/bin/zsh

# PATH
#export PATH="/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
#export EDITOR='subl -w'
# export PYTHONPATH=$PYTHONPATH
# export MANPATH="/usr/local/man:$MANPATH"

# Virtual Environment
export WORKON_HOME=$HOME/Projects/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh

# Owner
export USER_NAME="nicksinclair"
#eval "$(rbenv init -)"

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }
function lsaf() { /bin/ls -aF |  sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/  /g'; echo }
function ppwd() { pwd | sed -e 's@/Users/[^/]*/@~/@g' } 

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Aliases
alias cppcompile='c++ -std=c++11 -stdlib=libc++'

# Use sublimetext for editing config files
#alias zshconfig="subl ~/.zshrc"
#alias envconfig="subl ~/Projects/config/env.sh"
