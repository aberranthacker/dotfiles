# .vim

**As an example: to install the fugitive plugin as a git submodule, take the following steps:**
```
cd ~/.vim
mkdir ~/.vim/bundle
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```
Use ```git submodule update --init``` to install newly added submodules on another machine

**Installing your Vim environment on another machine**
```
cd ~
git clone http://github.com/username/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule init
git submodule update
```

**Upgrading a plugin bundle**
```
cd ~/.vim/bundle/fugitive
git pull origin master
```
**Upgrading all bundled plugins**
```
git submodule foreach git pull origin master
```

**Deleteting submodule**
```
git submodule deinit asubmodule    
git rm asubmodule
```
and seem you still need a
```
rm -rf .git/modules/asubmodule
```
