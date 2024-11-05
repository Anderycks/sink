#!/usr/bin/env bash

##
# Initial setup for a Mac.
##

set -e

# homebrew cd's when it installs, so keep track of
# where we start to be able to get back.
STARTING_DIR=$(pwd)

# Install homebrew and system packages.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/opt/homebrew/bin/brew install bash node python3 vim wget cmake git bash-completion@2
/opt/homebrew/bin/brew install --cask font-hack

# Make bash the default shell.
echo "/opt/homebrew/bin/bash" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/bash
cp shell/bash_profile ~/.bash_profile

# Setup links to iCloud files.
ln -s $HOME/Documents/Scripts $HOME/Scripts
ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs $HOME/iCloud
ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Developer $HOME/Developer

# This is really only needed so the vim install
# below can find everything in the correct PATH.
source ~/.bash_profile

##
# vim
##
cd $STARTING_DIR
VIMHOME=$HOME/.vim
VIMCOLORS=$VIMHOME/colors
VIMBUNDLE=$VIMHOME/bundle
cp vim/vimrc $HOME/.vimrc
mkdir -p $VIMCOLORS
cp vim/hyperhacking.vim $VIMCOLORS
git clone https://github.com/VundleVim/Vundle.vim.git $VIMBUNDLE/Vundle.vim
vim +PluginInstall +qall
cd $VIMBUNDLE/YouCompleteMe
python3 install.py --ts-completer
