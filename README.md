MyVim v0.5
=====
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/matthewgao/MyVim?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

My Vim automatic configuration script, support:
* MacOS
* Linux

## Installation
To setup automatically, please run:

~~~
wget -qO- https://raw.github.com/matthewgao/MyVim/master/setup.sh | sh
~~~
**NOTICE:**To make the airline show perfect, you can change the font of Terminal to a powerline support one.

## Plugins

* Bundle
* FuzzyFinder
* L9
* tagslist
* ctags
* NERDtree
* NERD-Commenter
* Auto-pair
* Ctrlp
* ctrlp-funky
* airline
* ~~powerline~~
* translate
* vim chinese doc
* calendar
* molokai colorscheme

## Caution
neocomplete需要lua支持，而默认的OSX Vim不包含lua，所以可能需要你手动卸载老的Vim, 我们的脚本会自动安装带有lua版本的

~~~
brew uninstall vim
~~~
然后再运行安装脚本

如果要手动处理，可以参照如下：

通过homebrew安装macvim:

~~~
brew install macvim --with-cscope --with-lua --HEAD
brew linkapps macvim
~~~
通过homebrew安装vim:

~~~
brew install vim --with-lua
~~~

###Ubuntu
如果你在使用ubuntu12.04甚至更老的version, 你需要手动下载vim源码并编译

~~~
./configure --with-lua
make && make install
~~~
我会努力把这部分功能自动化
## Next Step
reinstall vim with lua on OSX
