[[ -s ~/.profile ]] && source ~/.profile
# See following for more information: http://www.infinitered.com/blog/?p=19

# Path ------------------------------------------------------------
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH  # OS-X Specific, with MacPorts and MySQL installed
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH  # OS-X Specific, with MacPorts installed
#export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

if [ -d $HOME/bin ]; then
	export PATH=:$HOME/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
fi

# Load in .bashrc -------------------------------------------------
[[ -s ~/.bashrc ]] && source ~/.bashrc

# Hello Messsage --------------------------------------------------
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
#[[ -s "/Users/joelu/.rvm/scripts/rvm" ]] && source "/Users/joelu/.rvm/scripts/rvm"


#export PATH="/Users/joelu/Library/Application Support/GoodSync":$PATH
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/joelu/.sdkman"
[[ -s "/Users/joelu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/joelu/.sdkman/bin/sdkman-init.sh"

#initialize jevn if available
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# go things
if [ -d $HOME/.go ]; then
	export GOPATH=$HOME/.go
	export GOROOT=/usr/local/opt/go/libexec
	export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi
