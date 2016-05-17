#!/bin/sh
rm ~/.vim
rm ~/.vimrc
rm ~/.vimperatorrc
rm ~/.bash_profile
rm ~/.bashrc
rm ~/.bash_aliases
rm ~/.tmux.conf
rm ~/.ctags
rm ~/.gitconfig
rm ~/.gitignore

ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/vimperatorrc ~/.vimperatorrc
ln -s ~/dotfiles/bas_profile ~/.bash_profile
ln -s ~/dotfiles/bash_aliases ~/.bash_aliales
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/ctags ~/.ctags
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/global-gitignore ~/.gitignore

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir ~/.vim
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim -c "VundleInstall"

#cd ~/.vim/bundle/command-t/ruby/command-t
#make clean
#/usr/bin/ruby extconf.rb
#make

cd
