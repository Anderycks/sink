# #!/usr/bin/env bash

sudo apt update
sudo apt -y install python3 python3-dev nodejs npm vim wget build-essential cmake git

##
# gnome terminal theme
##
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.3.0/install.py | python3 -

##
# vim
##
VIMBUNDLE=$HOME/.vim/bundle
cp vim/vimrc $HOME/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git $VIMBUNDLE/Vundle.vim
vim +PluginInstall +qall
cd $VIMBUNDLE/YouCompleteMe
python3 install.py --ts-completer
