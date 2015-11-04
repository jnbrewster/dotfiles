set shell=/bin/sh

"#vimrc
call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
Plug 'ap/vim-css-color'

call plug#end()


"#---------------------------------------
"# displaying text and gui
"#---------------------------------------
set relativenumber
set showmode
set showcmd
set modeline
set ruler
set title
set visualbell
" hide the scrollbars in gui and split
set showmatch
set guioptions-=r
set guioptions-=T
set go-=L
set fillchars=vert:│,fold:-
highlight VertSplit cterm=none ctermbg=none ctermfg=yellow


"#---------------------------------------
"# colors and theme
"#---------------------------------------
set t_Co=256
" set vim to use term colors
set guifont=Monaco:h12
set t_Co=8 t_md=

colorscheme gruvbox

" set vim to use term colors
execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME

highlight clear SignColumn
hi TabLineFill	term=NONE		cterm=NONE	ctermbg=0
hi TablineSel		ctermfg=yellow
hi TabLine			ctermfg=green		ctermbg=0
hi IncSearch		ctermbg=yellow		ctermfg=red
hi Search				ctermbg=red		ctermfg=white
hi Visual				ctermbg=blue		ctermfg=black
hi Pmenu				ctermbg=yellow	ctermfg=black
hi VertSplit		ctermbg=black		ctermfg=black
hi StatusLineNC	ctermbg=white		ctermfg=black
hi StatusLine		ctermbg=blue	ctermfg=0
hi LineNr				ctermfg=green
hi cursorLine		cterm=NONE
hi TablineSel		ctermfg=blue


"#--------------------------------------
"# moving around, searching and patterns
"#--------------------------------------
set mouse=a
set incsearch
set hlsearch
set ignorecase
set smartcase


"#--------------------------------------
"# syntax, highlighting and spelling
"#--------------------------------------
set encoding=utf-8
set list listchars=tab:→\ ,trail:·
set nolist
syntax on
filetype on
filetype plugin on


"#--------------------------------------
"# editing text
"#--------------------------------------
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
set clipboard=unnamed
set noswapfile
set scrolloff=3
set sidescrolloff=5
set sidescroll=1
set cursorline
set wrap
set wrapmargin=8
set linebreak
set listchars=eol:⏎,tab:>-,trail:~,extends:>,precedes:<
" make insert mode change and drawing faster
set ttimeoutlen=100
set ttyfast
" get vim to read markdown files properly
autocmd BufNewFile,BufFilePre,BufRead *.md,*.txt set filetype=markdown
" auto comments are stupid
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" autosave on lost focus
au FocusLost * silent! wa
" Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e


"#--------------------------------------
"# tabs, spaces and indenting
"#--------------------------------------
set shiftwidth=2
set softtabstop=2
set tabstop=2
" can backspace through anything in insert mode
set backspace=indent,eol,start
set noai nocin nosi inde=
" leader t for new tab/page
let mapleader = " "
nmap <leader>t :tabe<CR>


"#--------------------------------------
"# folding
"#--------------------------------------
" setlocal foldmethod=indent
set foldmethod=manual


"#--------------------------------------
"# mapping
"#--------------------------------------
" pinky love"
vnoremap <C-c> <Esc>
" bind leader to space
nnoremap <space> <Nop>
let mapleader=" "
" remaps for moving around splits
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
let g:netrw_liststyle=3

"#--------------------------------------
"# Plugins
"#--------------------------------------
" Ctrlp
nnoremap <c-\> :CtrlP<CR>
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = 'rw'

let g:pad#dir = "~/Documents/"
