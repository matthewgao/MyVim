set nocompatible               " be iMproved
set shell=/bin/sh
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
Bundle 'Auto-Pairs'
Bundle 'The-NERD-Commenter'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'vim-airline'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'minibufexpl.vim'
Bundle 'rainbow_parentheses.vim'
Bundle 'python-syntax'
Bundle 'pyflakes.vim'

Bundle 'ctrlp.vim'
Bundle 'scrooloose/nerdtree'
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
set t_Co=256
set tabstop=4
set softtabstop=4
set shiftwidth=4
" FIXME
set expandtab
set autoindent
set nu
set ruler
set background=dark
colorscheme molokai
set showcmd
" 高亮搜索
set hlsearch
" 跟随搜索
set incsearch
set mouse=a
set linebreak
set mousemodel=popup
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

set autowrite
set cmdheight=2
" 去掉输入错的提示音
set noeb
set ignorecase
set wildmenu
"FIXME 允许backspace和光标跨越行边界
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set linespace=0
set wildmenu

filetype on
filetype plugin on
filetype plugin indent on     " required!

set completeopt=preview,menu
set completeopt=longest,menu"tab替换成空格
nmap tt :%s/\t/    /g<CR>

map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
map <silent> <F9> :TlistToggle <CR>

if version>=603
    set helplang=cn
    set encoding=utf-8
endif
let Tlist_Auto_Open=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

let NERDTreeIgnore=['\.pyc']

" crtlp setting
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif   " Mac/Linux

" neocomplete setting
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
	    call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*") 
		call append(line("."), " * ".expand("%")) 
		call append(line(".")+1, " * Created By: Matthew Gao") 
		call append(line(".")+2, " * Copyright (c) Dell.Inc") 
		call append(line(".")+3, " * Created Time: ".strftime("%c")) 
		call append(line(".")+4, " */") 
		call append(line(".")+5, "")
	endif
	if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
	"新建文件后，自动定位到文件末尾
endfunc

"rainbow_parentheses Config
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
