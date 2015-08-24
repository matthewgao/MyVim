MyVim
=====
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/matthewgao/MyVim?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

My Vim configuration, support
* MacOS
* Linux

## Caution
neocomplete需要lua支持，而默认的OSX Vim不包含lua，所以可能需要你手动卸载老的Vim

~~~
brew uninstall vim
~~~
然后再运行安装脚本

如果要手动处理，可以参照如下：

通过homebrew安装macvim:

~~~
brew install macvim --with-cscope --with-lua --HEAD
~~~
通过homebrew安装vim:

~~~
brew install vim --with-lua
~~~

## Setup
To setup automatically, please run:

~~~
wget -qO- https://raw.github.com/matthewgao/MyVim/master/setup.sh | sh -x
~~~

## 安装中文Help doc(Now Integrated to setup.sh)
下载的 tar.gz 包括所有翻译过的 vim 文档 (.cnx 文件)
先将其解压缩：

~~~
    tar zxvf vimcdoc-<version>.tar.gz
~~~
然后进入 vimcdoc-<version> 目录并执行

~~~
    ./vimcdoc.sh -i
~~~
就可以了。该安装程序会自动识别 Vim 的安装路径，将中文的文档拷贝
到相应的地方。原有的英文文档不受影响。
