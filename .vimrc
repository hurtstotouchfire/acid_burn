" Le .vimrc of Austin Soplata. In all probability, overconfigured.
" Many of these are taken from http://www.linuxjournal.com/article/3805?page=0,1
" last updated 2012_02_17

""" tips? 
"';66,81s/color/texture/g' replaces all instances of color from lines 66-81 with texture, awesome
" ':source ~/.vimrc' to reset .vimrc live?


syntax on "Obvious.

set number "shows line numbers

set autoindent "does 'dumb' indent, where automatically indents similar to previous line

set wildmenu "in cmds and maybe more, displays possible autocompletions if tab hit
set wildmode=longest,list "tab-autocomplete to longest common string, and display list of ALL possibilites

set incsearch "highlights the immediate next instance of a search string via /

set hlsearch "highlights all future instances of a search string with 

set ignorecase "removes case reqs in search...
set smartcase "unless non-lowercase letters searched for

set scrolloff=2 "keeps at least 2 lines shown around the cursor

set textwidth=80 "makes a hard line break at 76, currently off.
au BufEnter *.tex set textwidth=0 "so doesn't apply to tex files

"Mappings.__________________________________________________

"maps colon to just a press of semicolon, for easier cmd instigation
map ; :

"map curly brackets to regular brackets for no shift paragraph movement
map [ {
map ] }

"map ctrl-l to delete the previous word in insert mode, finally got this on 2012_02_17!!!
imap <c-l> <c-w>

"map $, go to beginning of line, to 4, bc that binding is full retard
map 9 $

"maps r to replace whatever is Visual selected with what's in the buffer
vmap r "_dP 

" On OSX, uses sys calls to copy to/from clipboard in insert mode
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p
