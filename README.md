MyVim
=====
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/matthewgao/MyVim?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

My Vim configuration, support
* MacOS
* Linux

## Setup
To setup automatically, please run:

~~~
wget -qO- https://raw.github.com/matthewgao/MyVim/master/setup.sh | sh -x
~~~

## 安装中文Help doc
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
