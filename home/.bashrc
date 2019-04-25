## Joe's ~/.bashrc
[ -z "$PS1" ] && return

# load common profile
[[ -s $HOME/.bash_profile ]] && source $HOME/.bash_profile

PS1="${GREEN}\u${NORMAL}@${RED}\h${NORMAL} : ${BLUE}\W${GREEN}\$(git_branch)\$ ${NORMAL}"

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
[[ -s /usr/local/etc/bash_completion ]] && source /usr/local/etc/bash_completion

# Git completion
[[ -s /usr/local/etc/bash_completion.d/git-completion.bash ]] && source /usr/local/etc/bash_completion.d/git-completion.bash

# Locale and editor
export EDITOR='subl -w'
#export BROWSER="firefox '%s' &"

# setup node version manager
[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
