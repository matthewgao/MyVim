#!/bin/bash
echo "Installing....., Please wait for a moment"
if which apt-get >/dev/null; then
        sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev git
elif which yum >/dev/null; then
        sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel   
fi

##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim ctags git astyle
fi

sudo easy_install -ZU autopep8 
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
mv -f ~/vim ~/vim_old
cd ~/ && git clone https://github.com/matthewgao/MyVim.git
mv -f ~/.vim ~/.vim_old
mv -f ~/vim ~/.vim
mv -f ~/.vimrc ~/.vimrc_old
mv -f ~/.vim/.vimrc ~/
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "Installing Bundle program, please wati for a while" > matthewgao
echo "安装完毕将自动退出" >> matthewgao
echo "请耐心等待" >> matthewgao
vim matthewgao -c "BundleInstall" -c "q" -c "q"
rm matthewgao
echo "ALL Done!"
