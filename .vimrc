" Le .vimrc of Austin Soplata. Unnecessarily large, just like his ego.
" Last update: Tue Mar  6 20:30:11 EST 2012

""" tips? 
" ';66,81s/color/texture/g' replaces all instances of color from lines 66-81 with texture, awesome
" ':source ~/.vimrc' to reset .vimrc live?
" ':r !date' to insert the time from the Unix date utility

syntax on "Obvious.

" solarized options 
let g:solarized_termcolors = 256 
let g:solarized_visibility = "high" 
let g:solarized_contrast = "high" 
syntax enable
set background=dark
colorscheme solarized 

"for pathogen plugin help, can easily access plugins at ~/.vim/bundle at runtime, whatever that means.
"call pathogen#infect()
"""calling the above for some reason spits out a bunch of gibberish; may have
"""wrong pathogen file

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

"Mappings.__________________________________________________

"maps colon to just a press of semicolon, for easier cmd instigation
map ; :

"map curly brackets to regular brackets for no shift paragraph movement
map [ {
map ] }

"map ctrl-l to delete the previous word in insert mode, finally got this on 2012_02_17!!!
imap <c-l> <c-w>

"map $, go to beginning of line, to 9, bc that binding is full retard 
map 9 $

"map space to insert just one character
nmap <Space> i_<Esc>r

"maps r to replace whatever is Visual selected with what's in the buffer
"not sure I've ever used this
vmap r "_dP 

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

