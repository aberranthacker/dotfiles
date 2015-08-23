#!/bin/sh
rm ~/.vim
rm ~/.vimrc
rm ~/.vimperatorrc
rm ~/.bashrc
rm ~/.tmux.conf
rm ~/.ctags
rm ~/.gitconfig
rm ~/.gitignore

ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/vimperatorrc ~/.vimperatorrc
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/ctags ~/.ctags
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/global-gitignore ~/.gitignore
