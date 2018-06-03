## Joe's ~/.bashrc
[ -z "$PS1" ] && return

# Basic options
#export HISTIGNORE="&:ls:exit:lo:ll:history"
#export HISTCONTROL=erasedups
# make history file bigger
HISTFILE=$HOME/.bash_history
HISTSIZE=10000
HISTFILESIZE=999999
# don't let the users enter commands that are ignored in the history file
HISTIGNORE=""
HISTCONTROL=""
# ignore commands that lead with a space, ignore dups
HISTCONTROL=ignoreboth,ignoredups
shopt -s histappend

readonly HISTFILE
readonly HISTSIZE
readonly HISTFILESIZE
readonly HISTIGNORE
readonly HISTCONTROL
export HISTFILE HISTSIZE HISTFILESIZE HISTIGNORE HISTCONTROL

#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
#export COLORFGBG='default;default'

#shopt -s checkwinsize
#eval "$(dircolors -b /etc/dircolors)"

# Prompt
BGREEN='\[\033[1;32m\]'
GREEN='\[\033[0;32m\]'
BRED='\[\033[1;31m\]'
RED='\[\033[0;31m\]'
BBLUE='\[\033[1;34m\]'
BLUE='\[\033[0;34m\]'
NORMAL='\[\033[00m\]'
COLOR_BROWN='\033[0;33m'
COLOR_GRAY='\033[1;30m'
PS1="${GREEN}\u${NORMAL}@${RED}\h${NORMAL} : ${BLUE}\W\$ ${NORMAL}"

# Paths
#PATH=$PATH:${HOME}/bin:/usr/lib/wine/bin:/sbin:/usr/sbin
#export PATH=$PATH:/usr/local/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/wine/lib:/usr/local/lib
#export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

# X Terminal titles
case "$TERM" in
xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
	;;
*)
	;;
esac

# Bash completion
[[ -s /etc/bash_completion ]] && source /etc/bash_completion

# Locale and editor
export EDITOR='subl -w'
#export BROWSER="firefox '%s' &"

# setup node version manager
[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
