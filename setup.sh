#!/usr/bin/env bash

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\33[32m[✔]\33[0m ${1}${2}"
    else
        error "Execute fail"
    fi
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

echo "Installing....., Please wait for a moment"
if which apt-get >/dev/null; then
    echo "You are using apt-get, installing vim vim-gnome ctags xclip astyle python-setuptools python-dev git"
    sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev git
    ret="$?"
    success "Install vim successfully"
elif which yum >/dev/null; then
    echo "You are using yum, installing gcc vim git ctags xclip astyle python-setuptools python-devel"
    sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel   
    ret="$?"
    success "Install vim successfully"
##Add HomeBrew support on  Mac OS
elif which brew >/dev/null;then
    echo "You are using HomeBrew, installing vim with lua"
    brew install vim --with-lua
    brew install ctags git astyle
    ret="$?"
    success "Install vim successfully"
else
    error "Install Vim and other tools FAIL!"
fi

#Backup old config, and cp the new config to the right place.
sudo easy_install -ZU autopep8 
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags

if [ ! -d ~/.vim_old ]; then
    mv -f ~/.vim ~/.vim_old && mkdir ~/.vim
    ret="$?"
    success "Backup ./.vim successfully"
else
    mv -f ~/.vim ~/.vim_old 
    mkdir ~/.vim
    echo "~/.vim_old already existed, skip....."
fi

if [ ! -f ~/.vimrc_old ]; then
    mv -f ~/.vimrc ~/.vimrc_old
    ret="$?"
    success "Backup ./.vimrc successfully"
else
    echo "~/.vimrc_old already existed, skip....."
fi

cd ~/ && git clone https://github.com/matthewgao/MyVim.git
#ret="$?"
#success "Successfully clone MyVim.git"
cp -R ~/MyVim/vim/* ~/.vim
ret="$?"
success "successfully copy new .vim"
cp ~/MyVim/vimrc  ~/.vimrc
ret="$?"
success "successfully copy new .vimrc"
cd ~/MyVim/vimcdoc-1.9.0/ && ./vimcdoc.sh -i
ret="$?"
success "Successfully install vim chinese doc"
cd ~/ && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
#ret="$?"
#success "Successfully clone vundle.git"
##Install Bundle plugins, todo list is in the .vimrc 
vim  -c "BundleInstall" -c "qa"
rm -rf MyVim
ret="$?"
success "ALL Set!, Start your Vim adventure~"
