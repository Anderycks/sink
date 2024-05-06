# #!/usr/bin/env bash

# Setup a computer for dev, which mostly means
# my vim configuration.

# homebrew cd's when it installs, so keep track of
# where we start so we can get back here.
STARTING_DIR=$(pwd)

##
# Install depenendencies based on platform.
MACHINE_NAME="$(uname)"
if [ $MACHINE_NAME == "Darwin" ]; then
    eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install node python3 macvim wget cmake git bash-completion@2
elif [ $MACHINE_NAME == "Linux" ]; then
    # Assumes Ubuntu.
    apt update
    apt -y install python3 python3-dev nodejs vim wget build-essential cmake git
fi

cd $STARTING_DIR

##
# vim
##
VIMHOME=$HOME/.vim
VIMCOLORS=$VIMHOME/colors
VIMBUNDLE=$VIMHOME/bundle
cp vimrc $HOME/.vimrc

##
# vim themes.
##
mkdir -p $VIMCOLORS
# lucius is a fallback vim theme, but my own hyperhacking theme
# is my normal vim theme.
wget https://raw.githubusercontent.com/jonathanfilip/vim-lucius/master/colors/lucius.vim \
    -O $VIMCOLORS/lucius.vim
cp hyperhacking.vim $VIMCOLORS

##
# vim plugins with Vundle.
##
git clone https://github.com/VundleVim/Vundle.vim.git $VIMBUNDLE/Vundle.vim
vim +PluginInstall +qall
cd $VIMBUNDLE/YouCompleteMe
python3 install.py --ts-completer
