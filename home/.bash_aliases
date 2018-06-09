# Aliases
alias ip='ipconfig getifaddr en0'
alias ipext='curl -s http://checkip.dyndns.org/ | grep -o '[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*.[0-9]*''

if ls --color=auto &> /dev/null; then
  #Linux
  alias ls='ls --color=auto'
else
  export CLICOLOR=1
  alias ls='ls -G'
fi
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
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias histg="history | grep"

# System command aliases
#alias df="df -Tha --total"
#alias du="du -ach | sort -h"
#alias free="free -mt"
#alias ps="ps auxf"
#alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
#alias myip="curl http://ipecho.net/plain; echo"
#
#
#alias runlevel='sudo /sbin/init'
