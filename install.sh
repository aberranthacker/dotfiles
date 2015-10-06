#!/bin/sh
rm ~/.vim
rm ~/.vimrc
rm ~/.vimperatorrc
rm ~/.bashrc
rm ~/.tmux.conf
rm ~/.ctags
rm ~/.gitconfig
rm ~/.gitignore

ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vimperatorrc ~/.vimperatorrc
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/ctags ~/.ctags
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/global-gitignore ~/.gitignore

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir ~/.vim
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd ~/.vim/bundle/command-t/ruby/command-t
make clean
/usr/bin/ruby extconf.rb
make

cd
