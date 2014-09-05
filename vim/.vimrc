" A lot of this has been pulled from other sources
" github.com/square/maximum-awesome

" Initialize pathogen
execute pathogen#infect()
Helptags

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Disable backing up
set nowb
set nobk
" don't store swap files in current directory
set directory-=.

" Line numbers
set nu

"""" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set noshowmode

" Set the background
colorscheme base16-eighties
set bg=dark

" tab width
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set expandtab

" case-insensitive search
set ignorecase
" if caps, case sensitive search
set smartcase

" show navigable menu for tab completion
set wildmenu
set wildmode=longest,list,full

" clipboard options
set clipboard=unnamed

let mapleader = ";"

" maps for toggling minibufexplorer
nmap <Leader>mbe :MBEOpen<cr>
nmap <Leader>mbc :MBEClose<cr>
nmap <Leader>mbt :MBEToggle<cr>
nmap <Leader>n :MBEbn<cr>
nmap <Leader>b :MBEbp<cr>
nmap <Leader>bb :MBEbb<cr>

" maps for moving between windows
nmap <Leader>j <C-w>j
nmap <Leader>k <C-w>k
nmap <Leader>h <C-w>h
nmap <Leader>l <C-w>l

"""" NERDTree
" open a tree on startup
"autocmd vimenter * NERDTree
" open even if no files specified
autocmd vimenter * if !argc() | NERDTree | endif
" toggle
nmap <Leader>nt :NERDTree<cr>

" toggle comments
nmap <Leader>/ :ci<cr>

" enter visual block mode
nmap <Leader>v <C-v>

" ruby stuff
inoremap <M-a> <C-x><C-o>

" rake run the current files test with rails.vim
autocmd FileType cucumber compiler cucumber | setl makeprg=cucumber\ \"%:p\"
autocmd FileType ruby
  \ if expand('%') =~# '_test\.rb$' |
  \   compiler rubyunit | setl makeprg=testrb\ \"%:p\" |
  \ elseif expand('%') =~# '_spec\.rb$' |
  \   compiler rspec | setl makeprg=rspec\ \"%:p\" |
  \ else |
  \   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
  \ endif
autocmd User Bundler
  \ if &makeprg !~# 'bundle' | setl makeprg^=bundle\ exec\  | endif

" maps miscellaneous command maps
nmap <Leader>s :w!<cr>
nmap <Leader>q :q!<cr>
" global paste and copy
map <Leader>pp "+p
vmap <Leader>y "+y
" escape
vmap <Leader>; <Esc>
imap <Leader>; <Esc>
" redo change
nmap <Leader>r <C-r>
" complete word
imap <Leader>c <C-p>

" Ultisnips =======
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<Leader><tab>"

" CoffeeCompile ==========
setl scrollbind
nmap <Leader>js :CoffeeWatch vert <cr>
" close buffer
nmap <Leader>cof <C-w>l :q! <cr>

" Move a line of text using Command+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Ruby, Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.rb :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
" And set the font
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set guifont=Sauce\ Code\ Powerline
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
