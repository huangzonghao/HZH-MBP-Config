#!/bin/bash

sed -i 's/git@github.com:/https:\/\/github.com\//' .gitmodules
git submodule update --init --recursive
ln -s $DOTFILES_PATH/vim/configs/vimrc $HOME/.vimrc
ln -s $DOTFILES_PATH/vim $HOME/.vim

# vim:set et sw=4 ts=4 ft=bash:
