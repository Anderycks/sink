# #!/usr/bin/env bash

##
# Initial environment setup.
##

# homebrew cd's when it installs, so keep track of
# where we start to be able to get back. This is
# safe to do on Linux as well. No harm.
STARTING_DIR=$(pwd)

##
# Install depenendencies based on platform.
##
MACHINE_NAME="$(uname)"
if [ $MACHINE_NAME == "Darwin" ]; then
    eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install bash node python3 vim wget cmake git bash-completion@2
elif [ $MACHINE_NAME == "Linux" ]; then
    # Assumes Ubuntu.
    sudo apt update
    sudo apt -y install python3 python3-dev nodejs npm vim wget build-essential cmake git
fi

cd $STARTING_DIR

##
# vim
##
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
