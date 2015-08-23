set nocompatible               " be iMproved
set shell=/bin/sh
filetype off                   " required!
syntax on
syntax enable


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
"这是vundle本身的设置
Bundle 'gmarik/vundle'  
 
 " My Bundles here:
 "这里是设置你自己自定义的插件的设置vundle设置，注意：下载的插件git为：https://github.com/godlygeek/tabular.git，则设置为Bundle 'godlygeek/tabular';https://github.com/gmarik/vundle.git设置则为 Bundle 'gmarik/vundle'  
 " original repos on github
Bundle 'godlygeek/tabular'

 " vim-scripts repos，vim-scripts的访问地址，格式则如下：
Bundle 'L9'
Bundle 'FuzzyFinder'
 " non github repos ，非git的访问地址的，格式如下：
Bundle 'git://git.wincent.com/command-t.git'
 " ...
"Bundle 'ctrlp.vim'
Plugin 'ctrlp.vim'
Plugin 'scrooloose/nerdtree'
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set tabstop=4
set softtabstop=4
set shiftwidth=4
" FIXME
set expandtab
set autoindent
set nu
set ruler
set showcmd
" 高亮搜索
set hlsearch
set mouse=a

if version>=603
    set helplang=cn
    set encoding=utf-8
endif
let Tlist_Auto_Open=1
let Tlist_Exit_OnlyWindow=1


