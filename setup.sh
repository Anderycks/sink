#!/usr/bin/env zsh

##
# Initial setup for a Mac.
#
# Assumes initial Mac provisioning and related
# AppleID logins.
##

set -e

# homebrew cd's when it installs, so keep track of
# where we start to be able to get back.
STARTING_DIR=$(pwd)

# Install homebrew and system packages.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/opt/homebrew/bin/brew install node@22 python3 flake8 vim wget cmake git zsh-completions
/opt/homebrew/bin/brew install --cask ghostty font-hack-nerd-font firefox@developer-edition

cp shell/zshrc ~/.zshrc

# Setup links to iCloud files.
ln -s $HOME/Documents/Scripts $HOME/Scripts
ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs $HOME/iCloud
ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Developer $HOME/Developer

# This is really only needed so the vim install
# below can find everything in the correct PATH.
source ~/.zshrc

# Ensure ghostty config is downloaded from iCloud
# before trying to cp it.
brctl download ~/Developer/Dev-Tools/sink/shell/ghostty-config
mkdir ~/Library/Application\ Support/com.mitchellh.ghostty
cp ~/Developer/Dev-Tools/sink/shell/ghostty-config \
    ~/Library/Application\ Support/com.mitchellh.ghostty/config

##
# vim
##
cd $STARTING_DIR
VIMHOME=$HOME/.vim
VIMCOLORS=$VIMHOME/colors
VIMBUNDLE=$VIMHOME/bundle
cp vim/vimrc $HOME/.vimrc
mkdir -p $VIMCOLORS
wget https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/refs/heads/master/colors/atom-dark-256.vim \
    -O $VIMCOLORS/atom-dark-256.vim
cp vim/hyperhacking.vim $VIMCOLORS
git clone https://github.com/VundleVim/Vundle.vim.git $VIMBUNDLE/Vundle.vim
vim +PluginInstall +qall
cd $VIMBUNDLE/YouCompleteMe
python3 install.py --ts-completer
