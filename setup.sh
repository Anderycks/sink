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
/opt/homebrew/bin/brew install node@22 python3 flake8 vim wget cmake git zsh-completions uv
/opt/homebrew/bin/brew install --cask ghostty font-hack-nerd-font firefox@developer-edition \
    moom amethyst

cp shell/zshrc ~/.zshrc

# Setup links to iCloud files.
ln -s $HOME/Documents/Scripts $HOME/Scripts
ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs $HOME/iCloud
ln -s $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Developer $HOME/Developer

# This is really only needed so the vim install
# below can find everything in the correct PATH.
source ~/.zshrc

mkdir ~/Library/Application\ Support/com.mitchellh.ghostty
cp shell/ghostty-config ~/Library/Application\ Support/com.mitchellh.ghostty/config

##
# vim
##
cd $STARTING_DIR
VIMHOME=$HOME/.vim
VIMCOLORS=$VIMHOME/colors
VIMBUNDLE=$VIMHOME/bundle
cp vim/vimrc $HOME/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git $VIMBUNDLE/Vundle.vim
vim +PluginInstall +qall
cd $VIMBUNDLE/YouCompleteMe
python3 install.py --ts-completer
