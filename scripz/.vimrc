set nocompatible

set backspace=indent,eol,start

set autoindent

if has("vms")
	set nobackup
else
	set backup
endif

set history=50

set ruler

set showcmd

set incsearch

map <\> 
map <F5> i(<Esc>ea)<Esc>

if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

filetype plugin on
filetype plugin indent on

autocmd FileType text setlocal textwidth=78

autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") | 
	\ 	exe "normal! g'\"" |
	\ endif

