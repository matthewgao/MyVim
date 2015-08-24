#!/usr/bin/env bash

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\33[32m[✔]\33[0m ${1}${2}"
    fi
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

ret="$?"
success "Installing....., Please wait for a moment"
if which apt-get >/dev/null; then
    success "You are using apt-get, installing vim vim-gnome ctags xclip astyle python-setuptools python-dev git"
    sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev git
    success "Install vim successfully"
elif which yum >/dev/null; then
    success "You are using yum, installing gcc vim git ctags xclip astyle python-setuptools python-devel"
    sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel   
    success "Install vim successfully"
##Add HomeBrew support on  Mac OS
elif which brew >/dev/null;then
    success "You are using HomeBrew, installing vim with lua"
    brew install vim --with-lua
    brew install ctags git astyle
    success "Install vim successfully"
else
    error "Install Vim and other tools FAIL!"
fi

#Backup old config, and cp the new config to the right place.
sudo easy_install -ZU autopep8 
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
mv -f ~/vim ~/vim_old
cd ~/ && git clone https://github.com/matthewgao/MyVim.git
mv -f ~/.vim ~/.vim_old && mkdir .vim && cp -R ~/MyVim/vim/* ~/.vim
mv -f ~/.vimrc ~/.vimrc_old && cp ~/MyVim/vimrc  ~/.vimrc
cd ~/MyVim/vimcdoc-1.9.0/ && ./vimcdoc.sh -i
cd ~/ && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

##Install Bundle plugins, todo list is in the .vimrc 
vim  -c "BundleInstall" -c "qa"
rm -rf MyVim

success "ALL Set!, Start your Vim adventure~"
