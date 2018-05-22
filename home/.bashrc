## Joe's ~/.bashrc
[ -z "$PS1" ] && return

# Basic options
#export HISTIGNORE="&:ls:exit:lo:ll:history"
#export HISTCONTROL=erasedups
# make history file bigger
HISTFILE=~/.bash_history
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

# Aliases
alias ip='ipconfig getifaddr en0'
alias ipext='curl -s http://checkip.dyndns.org/ | grep -o '[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*.[0-9]*''
alias ls='ls -G'
alias ll='ls -lA'
alias la='ls -A'
alias lla='ls -la'
alias l='ls -CF'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias findn='find . -name '"${1}"''
alias svim='sudo vim'
alias h='cd'
alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias s='subl'
alias back='cd $OLDPWD'
alias root='sudo su'
#alias runlevel='sudo /sbin/init'
#alias grep='grep -G'
#alias dfh='df -h'
#alias gvim='gvim -geom 84x26'
#alias start='dbus-launch startx'

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

# Functions
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1		;;
			*.tar.gz)	tar xzf $1		;;
			*.bz2)		bunzip2 $1		;;
			*.rar)		rar x $1		;;
			*.gz)		gunzip $1		;;
			*.tar)		tar xf $1		;;
			*.tbz2)		tar xjf $1		;;
			*.tgz)		tar xzf $1		;;
			*.zip)		unzip $1		;;
			*.Z)		uncompress $1	;;
			*)			echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}
ziprm () {
	if [ -f $1 ] ; then
		unzip $1
		rm $1
	else
		echo "Need a valid zipfile"
	fi
}
psgrep() {
	if [ ! -z $1 ] ; then
		echo "Grepping for processes matching $1..."
		ps aux | grep -v grep | grep $1
	else
		echo "!! Need name to grep for"
	fi
}
grab() {
	sudo chown -R ${USER} ${1:-.}
}

# Bash completion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Locale and editor
export EDITOR='subl -w'
#export BROWSER="firefox '%s' &"

# setup node version manager
. ~/.nvm/nvm.sh


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/Users/joelu/.sdkman"
#[[ -s "/Users/joelu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/joelu/.sdkman/bin/sdkman-init.sh"
