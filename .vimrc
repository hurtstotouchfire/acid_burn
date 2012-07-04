"""
    "'File:                   .vimrc
    "' Author:                Austin Soplata, of austin.soplata@gmail.com 
    "' Last Modified:         Tue Jul 03 10:16 PM 2012 EDT
    "' Known Dependencies:    lastchange.vim in ~/.vim/plugin
    "' Inputs:                x 
    "' Outputs:               x 
    "' Description:           Not nearly as long as his...ego. 
    "' Todo:                  x 
"""


""" tips? 
" ';66,81s/color/texture/g' replaces all instances of color from lines 66-81 with texture, awesome

"" even better: incremental replace! use 
" ':let i=1 | 38,46g/foo/s//\="bar_".i/ | let i=i+1'
" to replace 'foo' in lines 38 to 46 with 'bar_1' on line 38, then 'bar_2' on
" line 39, etc.! Faaaantastic.

" ':source ~/.vimrc' to reset .vimrc live?
" ':r !date' to insert the time from the Unix date utility

" 'gqap' apparently reformats the paragraph text

""" end of tips, beginning of real buzinez

syntax on "Obvious.
"let $VIM ='~/Dropbox/progz/acid_burn/.vim/'
let $VIM ='~/.vim/'

"for pathogen plugin help, can easily access plugins at ~/.vim/bundle at runtime, whatever that means.
call pathogen#infect()
call pathogen#helptags()

" solarized options 
let g:solarized_termcolors = 256 
let g:solarized_visibility = "high" 
let g:solarized_contrast = "high" 
syntax enable
set background=dark
colorscheme solarized 

set guifont=Inconsolata:h16

set number "shows line numbers

set ruler "shows cursor location

set wildmenu "in cmds and maybe more, displays possible autocompletions if tab hit
set wildmode=longest,list "tab-autocomplete to longest common string, and display list of ALL possibilites

set incsearch "highlights the immediate next instance of a search string via /

set hlsearch "highlights all future instances of a search string with 

set ignorecase "removes case reqs in search...
set smartcase "unless non-lowercase letters searched for

set scrolloff=2 "keeps at least 2 lines shown around the cursor

set autoindent "does 'dumb' indent, where automatically indents similar to previous line
" These tab fixtures, predominantly for python, from http://www.velocityreviews.com/forums/t539545-vim-whats-a-smarttab.html
set tabstop=4 "4 space tab
set shiftwidth=4 "The amount to block indent when using < and >
set smarttab "Uses shiftwidth instead of tabstop at start of lines
set expandtab "Replaces a <TAB> with spaces--more portable
set softtabstop=4 "Causes backspace to delete 4 spaces = converted <TAB>

set textwidth=80 "makes a hard line break at 76
au BufEnter *.tex set textwidth=0 "so doesn't apply to tex files
au BufEnter *.txt set textwidth=0 "so doesn't apply to typical text files
au BufEnter *.html set textwidth=0 "so doesn't apply to html files

set noswapfile

" shows a basic line w/ the current buffer's file, in addition to forcing the
" modeline
set modeline
set ls=2

" from http://nvie.com/posts/how-i-boosted-my-vim/ highlights whitespaces:
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

"Mappings.__________________________________________________

"maps colon to just a press of semicolon, for easier cmd instigation
nmap ; :

"map curly brackets to regular brackets for no shift paragraph movement
vmap [ {
vmap ] }
nmap [ {
nmap ] }

"map ctrl-l to delete the previous word in insert mode, finally got this on 2012_02_17!!!
imap <c-l> <c-w>

"map $, go to beginning of line, to 9, bc that binding is full retard 
map 9 $

"map space to insert just one character
nmap <Space> i_<Esc>r

" On OSX, uses sys calls to copy to/from clipboard in insert mode
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
" was mapped to <C-v>, but Visual Block is useful for commenting text blocks
nmap <C-k> :call setreg("\"",system("pbpaste"))<CR>p

" In insert mode, autocloses parentheses, brackets, braces, single and dub q's
imap ( ()<Left>
imap [ []<Left>
imap { {}<Left>
au BufEnter *.html imap < <lt>><Left>

" For m-files, when type 'for,', automagically make an 'end' on the line below
au BufEnter *.m imap for, for<CR><CR>end<Esc>kkA
au BufEnter *.m imap if, if<CR><CR>end<Esc>kkA

nmap <silent> <c-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"from http://nvie.com/posts/how-i-boosted-my-vim/
"allows comma to act as the first key in chain command eg Emacs' Meta-x
let mapleader=","
""thus, allows these to use ",ev/,sv" to edit/reload vimrc file.
""Use this to let your imagination run wild.
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"nonfunctional, since requires ruby and can't get it to work in MacVim
" nmap <leader>t :CommandT<CR> 

"opens file, eg new tab in default browser, for current file
nmap <leader>o :!open % &<CR><CR>
"need full path, not just %'s name of file
nmap <leader>d :lcd %:p:h<CR>
"for .tex, changed path of buffer to that of current file and prints it
" au BufEnter *.tex 
" nmap <leader>p :lcd %:p:h<CR> :!pdflatex %<CR>
au BufEnter *.tex nmap <leader>p :!pdflatex %<CR>

"inserts code header
" au BufEnter *.m 
nmap <leader>intro i%{<CR>
        \<C-i> File: <C-i><C-i><C-i><C-i><C-i>x<CR>
        \Author: <C-i><C-i><C-i><C-i>Austin Soplata, of austin.soplata@gmail.com <CR>
        \Last Modified:<C-i><C-i><C-i>x <CR>
	\Project: <C-i><C-i><C-i><C-i>x <CR>
        \Known Dependencies:<C-i>x <CR>
        \Inputs:<C-i><C-i><C-i><C-i>x <CR>
        \Outputs:<C-i><C-i><C-i><C-i>x <CR>
        \Description:<C-i><C-i><C-i>x <CR>
        \Todo:<C-i><C-i><C-i><C-i><C-i>x <CR>
        \<C-h><C-h>%}<CR><Esc>xx

" :put =expand('%:t')

" Easy window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" clear search string
nmap <silent> ,/ :nohlsearch<CR>

" experimental:
au BufEnter *.m imap plot, plot( <Right><CR> xlabel(' '<Right><CR>) ylabel(' '<Right><CR><Up><Up><Right><Right><Right><Right>


