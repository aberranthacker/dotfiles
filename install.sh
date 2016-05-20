#!/bin/sh

rm ~/.vimrc
rm ~/.vimperatorrc
rm ~/.bash_profile
rm ~/.bashrc
rm ~/.bash_aliases
rm ~/.tmux.conf
rm ~/.ctags
rm ~/.gitconfig
rm ~/.gitignore

ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/vimperatorrc ~/.vimperatorrc
ln -s ~/dotfiles/bash_profile ~/.bash_profile
ln -s ~/dotfiles/bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/ctags ~/.ctags
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/global-gitignore ~/.gitignore

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#if [ ! -d ~/.vim ]; then mkdir ~/.vim; fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim -c "VundleInstall"

cd
