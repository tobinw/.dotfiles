# module command
module() { eval `/usr/bin/modulecmd $modules_shell $*`; }

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#setup ps1
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUPSTREAM=verbose
export PROMPT_COMMAND=__prompt_command
if [[ $(type -t __git_ps1) == "function" ]] ; then
  GITCMD="__git_ps1"
else
  GITCMD=""
fi
function __prompt_command() {
  local EXIT="$?"
  local RCol='\[\e[0m\]'
  local Red='\[\e[0;31m\]'
  local Gre='\[\e[0;32m\]'
  [[ $EXIT != 0 ]] && Col=${Red} || Col=${Gre}
  PS1="${Col}\w${RCol}$($GITCMD) > "
}

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

git config --global alias.unadd "reset HEAD"
