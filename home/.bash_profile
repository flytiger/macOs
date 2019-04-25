# Basic options
#export HISTIGNORE="&:ls:exit:lo:ll:history"
#export HISTCONTROL=erasedups

# make history file bigger
HISTFILE=$HOME/.$(echo $0 | sed '/-/s/-//g')_history
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
# Source .profile if exists
[[ -s ~/.profile ]] && source ~/.profile

# Hello Messsage ---------------------------------------------------------------
echo -e "Kernel Information: " `uname -smr`
echo -e "${COLOR_BROWN}`bash --version`"
echo -ne "${COLOR_GRAY}Uptime: "; uptime
echo -ne "${COLOR_GRAY}Server time is: "; date

# Notes: ----------------------------------------------------------
# When you start an interactive shell (log in, open terminal or iTerm in OS X,
# or create a new tab in iTerm) the following files are read and run, in this order:
#     profile
#     bashrc
#     .bash_profile
#     .bashrc (only because this file is run (sourced) in .bash_profile)
#
# When an interactive shell, that is not a login shell, is started
# (when you run "bash" from inside a shell, or when you start a shell in
# xwindows [xterm/gnome-terminal/etc] ) the following files are read and executed,
# in this order:
#     bashrc
#     .bashrc

# This loads RVM into a shell session.
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#initialize jevn if available
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="~/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# Load in .bashrc, .bash_exports, .bash_aliases, .bashfunctions ----------------
for file in ~/.bash_{exports,aliases,functions}; do
    [[ -s "$file" ]] && source "$file"
done
unset file