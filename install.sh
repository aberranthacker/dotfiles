#!/bin/sh
cd ~/dotfiles
if [[ ! $(pwd) =~ "dotfiles" ]]; then exit; fi;

ln -sf dotfiles/vimrc ~/.vimrc
ln -sf dotfiles/vimperatorrc ~/.vimperatorrc
ln -sf dotfiles/bash_profile ~/.bash_profile
ln -sf dotfiles/bash_aliases ~/.bash_aliases
ln -sf dotfiles/bashrc ~/.bashrc
ln -sf dotfiles/tmux.conf ~/.tmux.conf
ln -sf dotfiles/ctags ~/.ctags
ln -sf dotfiles/gitconfig ~/.gitconfig
ln -sf dotfiles/global-gitignore ~/.gitignore

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim -c "VundleInstall"

mkdir colorschemes
cd colorschemes
git clone https://github.com/morhetz/gruvbox.git
git clone https://github.com/morhetz/gruvbox-contrib.git

ln -sf ~/dotfiles/colorschemes/gruvbox-contrib/konsole/Gruvbox_dark.colorscheme ~/.local/share/konsole/Gruvbox_dark.colorscheme
ln -sf ~/dotfiles/colorschemes/gruvbox-contrib/xresources/gruvbox-dark.xresources ~/.Xresources

cp gruvbox/colors/gruvbox.vim ~/.vim/bundle/vim-colorschemes/colors/

cd

