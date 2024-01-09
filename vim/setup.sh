# Setup my vim configuration.

VIMHOME=$HOME/.vim
VIMCOLORS=$VIMHOME/colors
VIMBUNDLE=$VIMHOME/bundle

cp vimrc $HOME/.vimrc

mkdir -p $VIMCOLORS
wget https://raw.githubusercontent.com/jonathanfilip/vim-lucius/master/colors/lucius.vim \
    -O $VIMCOLORS/lucius.vim
cp hyperhacking.vim $VIMCOLORS

git clone https://github.com/VundleVim/Vundle.vim.git $VIMBUNDLE/Vundle.vim
vim +PluginInstall +qall

# Dependencies for YouCompleteMe plugin.
brew install cmake

# This assumes all the initial setup for Node, Go, etc.
# has been done. Also requires build-essential and the like
# on Ubuntu.
cd $VIMBUNDLE/YouCompleteMe
python3 install.py --ts-completer
