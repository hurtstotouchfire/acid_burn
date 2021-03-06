"""
    "'File:                   .vimrc
    "' Author:                Austin Soplata, of austin.soplata@gmail.com
    "' Last Modified:         Tue May 14 03:25 PM 2013 EDT
    "' Known Dependencies:    lastchange.vim in ~/.vim/plugin
    "' Inputs:                x
    "' Outputs:               x
    "' Description:           Not nearly as long as his...ego.
    "' Todo:                  Never completed.
"""

"Tips._________________________________________________________________________
" ';66,81s/color/texture/g' replaces all instances of color from lines 66-81 with texture, awesome

"" even better: incremental replace! use
" ':let i=1 | 38,46g/foo/s//\="bar_".i/ | let i=i+1'
" to replace 'foo' in lines 38 to 46 with 'bar_1' on line 38, then 'bar_2' on
" line 39, etc.! Faaaantastic.

" ':r !date' to insert the time from the Unix date utility

" 'gqap' apparently reformats the paragraph text

" for folding, 'zfap' folds the paragraph, 'zo' opens, 'zc' closes

" ctrl-o jumps cursor to prev posn, and ctrl-i the opposite, even b/w buffers!

"
" ctrl-a increments a number, and ctrl-x decrements!
" omfg * searches for the word you're in
" :abbr pn penguin
" :abbr MS Mandrake Software
" define file that has nothing but abbrs?
"
" in insert, ctrl-t adds an indent to the line?
"
" Evervim usage
" do ':EvervimNotebookList'
"
""" Installing 'matchit.vim' for '%' match of html tags
" Generally must
"       'cd .vim/plugin
"       ln -vs /usr/local/share/vim/vim70/macros/matchit.vim
"       cd ../doc
"       ln -vs /usr/local/share/vim/vim70/macros/matchit.txt
"       vim --cmd "helptags . |quit"
" In my current case (2013_03_21:19:11) it's in
"   /usr/local/Cellar/vim/7.3.682/share/vim/vim73/macros
""" end of tips, beginning of real buzinez

"General Settings._____________________________________________________________
syntax on "Obvious.
let $VIM ='~/Dropbox/progz/acid_burn/.vim/'
"let $VIM ='~/.vim/'
let $Tlist_Ctags_Cmd='/usr/local/bin/ctags'

set guifont=Source_Code_Pro_Light:h14
"let g:Powerline_symbols = 'fancy'

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

" shows basic line w/ current buffer's file, in addition to forcing modeline
set modeline
set ls=2

" from http://nvie.com/posts/how-i-boosted-my-vim/ highlights whitespaces:
" set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.

" for some weird reason, backspace was only working to insert instance
set backspace=2

"stops that super annoying "Hit Enter" after every :w
set shortmess+=O

set clipboard=unnamed

" When opening new buffer, changes directory of that vim-window to that buffer.
" set autochdir

" Pathogen install.___________________________________________________________
"for pathogen plugin help, can easily access plugins at ~/.vim/bundle at runtime
"if get new plugins, can just throw into /bundle and they magically work?
call pathogen#infect()
call pathogen#helptags()

" Solarized theme install.____________________________________________________
colorscheme solarized
se t_Co=256
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
syntax enable
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

" General Plugin Settings (appear to must go after Pathogen).__________________
filetype plugin on
set ofu=syntaxcomplete#Complete
set nocompatible

"Non-plugin Mappings._________________________________________________________

"maps colon to just a press of semicolon, for easier cmd instigation
nnoremap ; :

"map curly brackets to regular brackets for no shift paragraph movement
vmap [ {
vmap ] }
nnoremap [ {
nnoremap ] }

"map ctrl-l to delete the previous word in insert mode, finally got this on 2012_02_17!!!
inoremap <c-l> <c-w>

"map $, go to beginning of line, to 9, bc that binding is dumb
" use map since can't d9 to delete to end of line w/o it, strangely still
" enters '9' in insert mode though so no prob.
map 9 $

"map space to insert just one character
nnoremap <ENTER> i_<Esc>r

" On OSX, uses sys calls to copy to/from clipboard in insert mode
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
" was mapped to <C-v>, but need Visual Block
""" "nnoremap <C-k> :call setreg("\"",system("pbpaste"))<CR>p

" In insert mode, autocloses parentheses, brackets, braces, single and dub q's
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
au BufEnter *.html inoremap < <lt>><Left>
au BufEnter *.html inoremap ' ''<Left>
au BufEnter *.html inoremap " ""<Left>
au BufEnter *.tex inoremap $ $$<Left>
" omfg...could not figure out the same html thing in cpp and ahve it work
" au BufEnter *.cpp imap <lt> <lt><lt><Right>

" Easier window navigation"
" nnoremap <C-J> <C-W><C-J> " interferes with tmux <C-j> binding
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" For m-files, when type 'for,', automagically make an 'end' on the line below
" NOTE 2012_10_05, this has been superseded by xptemplate snippets.
" au BufEnter *.m imap for, for<CR><CR>end<Esc>kkA
" au BufEnter *.m imap if, if<CR><CR>end<Esc>kkA
"
"allows comma to act as the first key in chain command eg Emacs' Meta-x
let mapleader=","
let maplocalleader="\\"
""thus, allows these to use ",ev/,sv" to edit/reload vimrc file.
""Go crazy with this!
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>eb :e /Users/wintermute/.bashrc<CR>
nmap <silent> <leader>sb :so ~/.bashrc<CR>

"opens file, eg new tab in default browser, for current file
nmap <leader>o :!open % &<CR><CR>
" need full path, not just %'s name of file
" note that that is a lowercase L
nmap <leader>l :lcd %:p:h<CR>
nmap <leader>h :lcd ~/Dropbox<CR>
nmap <leader>s :mksession! ~/Dropbox/Session.vim<CR>
nmap <leader>i I$ <esc>$l
nmap <leader>di I<del><del><esc>$
nmap <leader>m :w<CR>:!make<CR>

"for .tex, changed path of buffer to that of current file and prints it
" au BufEnter *.tex
" nmap <leader>p :lcd %:p:h<CR> :!pdflatex %<CR>
" au BufEnter *.tex nmap <leader>p :!pdflatex %<CR>

" :put =expand('%:t')

" clear search string
nmap <silent> ,/ :nohlsearch<CR>

nmap - dd
" selects word, for easy * word search
nmap <leader>w viw

" easy way to leave insert mode w/o ctrl
inoremap jk <esc>

nmap = :w<CR>

"Filetype-specific mappings and stuffz_______________________________________
"
" assuming pwd is local, automagically compiles and runs prog in this window
" nmap <localleader>z :!clang++ -o %.out % ; ./%.out
autocmd FileType cpp nnoremap <buffer> <localleader>p :!clang++ -stdlib=libc++ -std=c++11 -o %.out % ; ./%.out
autocmd FileType cpp nnoremap <buffer> <localleader>c I// <esc>$
autocmd FileType cpp nnoremap <buffer> <localleader>dc I<del><del><del><esc>$
autocmd FileType c nnoremap <buffer> <localleader>c I// <esc>$
autocmd FileType c nnoremap <buffer> <localleader>dc I<del><del><del><esc>$
autocmd FileType matlab nnoremap <buffer> <localleader>c I% <esc>$
autocmd FileType matlab nnoremap <buffer> <localleader>dc I<del><del><esc>$
autocmd FileType tex nnoremap <buffer> <localleader>c I% <esc>$
autocmd FileType tex nnoremap <buffer> <localleader>dc I<del><del><esc>$
autocmd FileType tex nnoremap <buffer> <localleader>p :!pdflatex %<CR>
autocmd FileType ode nnoremap <buffer> <localleader>c I# <esc>$
autocmd FileType ode nnoremap <buffer> <localleader>dc I<del><del><esc>$
autocmd FileType python nnoremap <buffer> <localleader>p :!python3 %
autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>$
autocmd FileType python nnoremap <buffer> <localleader>dc I<del><del><esc>$
autocmd FileType sh nnoremap <buffer> <localleader>c I# <esc>$
autocmd FileType sh nnoremap <buffer> <localleader>dc I<del><del><esc>$

"Plugin-related Information and Mappings._____________________________________

"" Nerdtree
nmap <silent> <c-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
" can adjust NERDTreeWinSize ?

"" Taglist
" nmap <C-g> :TlistToggle<CR>

"" Tagbar (includes scoping, instead of Taglist?)
nmap <C-g> :TagbarToggle<CR>

"" Command-T
nmap <leader>t :CommandT<CR>
"reset command-t in case of new file with :CommandTFlush

"" Vertical Indent options
let g:indent_guides_start_level=1
let g:indent_guides_guide_level=4
let g:indent_guides_enable_on_vim_startup = 1
set ts=4
set sw=4
"set background=dark
hi IndentGuidesOdd  ctermbg=22
hi IndentGuidesEven ctermbg=18

"" Configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
" build tags of your own project with Ctrl-F12
map <leader><leader>c :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q.<CR>

" for xptemplate, the c++ snippets, type e.g. 'for' then <C-\> FORWARD slash

"" For Easymotion, default is <leader><leader>w which is a whole nother level!
let g:EasyMotion_leader_key = '<Space>'

"" clang_complete
let g:clang_complete_copen=1 "auto opens quickfix window on error
let g:clang_auto_select=1 "auto selects first option
let g:clang_complete_auto=1 "auto complete?

"" New Powerline as of 2012_02_02
" python from powerline.bindings.vim import source_plugin; source_plugin()
" source ~/.vim/bundle/powerline-develop/powerline/bindings/vim/plugin/source_plugin.vim

" can't seem to get working
"""" Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_enable_signs=1
"let g:syntastic_check_on_open=1
"
""" Ctrl-P (file search) settings; will prolly replace Command-T
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

""" Makefile necessary stuff according to shane, 2013_05_10
au BufRead,BufNewFile Makefile* set noexpandtab
au BufRead,BufNewFile makefile* set noexpandtab
""au FileType make setlocal noexpandtab
