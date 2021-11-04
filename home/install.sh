#!/bin/sh

# ln -snf $PWD/.bashrc $HOME/.bashrc
# ln -snf $PWD/.bash_profile $HOME/.bash_profile
# ln -snf $PWD/.bash_aliases $HOME/.bash_aliases
# ln -snf $PWD/.bash_exports $HOME/.bash_exports
# ln -snf $PWD/.bash_functions $HOME/.bash_functions

# ln -snf $PWD/.zshrc $HOME/.zshrc
# install nerd fonts
cwd=$(pwd)
git clone https://github.com/powerline/fonts.git --depth=1 "${ZDOTDIR:-$HOME}/.nerd-fonts"
cd "${ZDOTDIR:-$HOME}/.nerd-fonts"
./install.sh
cd $cwd
rm -rf "${ZDOTDIR:-$HOME}/.nerd-fonts"

# install zsh prezto
# clone the presto repo
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Get prezto's default configuration
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# add my customizations
ln -snf $PWD/.zsh_profile $HOME/.zsh_profile
ln -snf $PWD/.zsh_aliases $HOME/.zsh_aliases
ln -snf $PWD/.zsh_exports $HOME/.zsh_exports
ln -snf $PWD/.zsh_functions $HOME/.zsh_functions

ln -snf $PWD/.gitconfig $HOME/.gitconfig
