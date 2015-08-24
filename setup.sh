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
    sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev git
elif which yum >/dev/null; then
    sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel   
fi

##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    success "You are using HomeBrew tool"
    brew install vim --with-lua
    brew install ctags git astyle
    success "Install successfully"
fi

sudo easy_install -ZU autopep8 
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
mv -f ~/vim ~/vim_old
cd ~/ && git clone https://github.com/matthewgao/MyVim.git
mv -f ~/.vim ~/.vim_old
mkdir .vim
cp -R ~/MyVim/vim/* ~/.vim
mv -f ~/.vimrc ~/.vimrc_old
cp ~/MyVim/vimrc  ~/.vimrc
cd ~/MyVim/vimcdoc-1.9.0/ && ./vimcdoc.sh -i
cd ~/ && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim  -c "BundleInstall" -c "q" -c "q"
rm -rf MyVim
success "ALL Set!"
