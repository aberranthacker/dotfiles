#!/bin/sh
sudo dnf install -y vim vim-X11 vifm vimiv-qt tmux emacs
# sudo dnf install -y wmctrl xdotool xclip xrandr
sudo dnf install -y exa fd-find ripgrep direnv mc
sudo dnf install -y yakuake
sudo dnf group install -y "Development Tools"
sudo dnf install -y postgresql-devel

# install Yarn and Node.js
sudo dnf module install -y nodejs:8
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo dnf install -y yarn

# Tern is a stand-alone, editor-independent JavaScript analyzer that can be used
# to improve the JavaScript integration of existing editors.
# used by spacemacs
sudo npm install -g tern

# rpm-fusion packages
sudo dnf install telegram-desktop

cd ~/dotfiles || exit

ln -sf dotfiles/vimrc ~/.vimrc

ln -sf dotfiles/_spacemacs ~/.spacemacs
ln -sf dotfiles/spacemacs ~/spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
git clone https://github.com/artempyanykh/evil-russian.git ~/.emacs.d/layers/private/evil-russian

ln -sf dotfiles/vimperatorrc ~/.vimperatorrc

ln -sf dotfiles/bash_profile ~/.bash_profile
ln -sf dotfiles/bash_aliases ~/.bash_aliases
ln -sf dotfiles/bashrc ~/.bashrc
# sets vi mode for command line
ln -sf dotfiles/inputrc ~/.inputrc

ln -sf dotfiles/tmux.conf ~/.tmux.conf
ln -sf dotfiles/ctags ~/.ctags

ln -sf dotfiles/gitconfig ~/.gitconfig
ln -sf dotfiles/global-gitignore ~/.gitignore

ln -sf dotfiles/bin ~/.bin

ln -sf dotfiles/pryrc ~/.pryrc
ln -sf dotfiles/spring.rb ~/.spring.rb

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Download Vim Plugin Manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c "PlugInstall" -c "qa!"

git submodule update --init

ln -sf ~/dotfiles/colorschemes/gruvbox-contrib/konsole/Gruvbox_dark.colorscheme ~/.local/share/konsole/Gruvbox_dark.colorscheme
ln -sf ~/dotfiles/colorschemes/gruvbox-contrib/xresources/gruvbox-dark.xresources ~/.Xresources

rm -rf ~/.config/vifm/colors
git clone https://github.com/vifm/vifm-colors ~/.config/vifm/color

# git clone https://github.com/soimort/translate-shell
# cd translate-shell/
# make PREFIX=~/.local install

cd
