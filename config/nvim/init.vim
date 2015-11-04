"
" ~/.config/nvim/init.vim
"

"
" GENERAL
"

" Disable vi compatibility.
set nocompatible

" Tab width.
set tabstop=2

" Tab width when editing.
set softtabstop=2

" Tab width when indenting in normal mode.
set shiftwidth=2

" Emit spaces instead of tabs.
set expandtab

" Automatically indent on newline.
set autoindent

" Command history.
set history=1000

" Ignore character case when searching.
set ignorecase

" Remap term movement to Esc
tnoremap <Esc> <c-\><c-n>

"
" UI
"

" Show line numbers.
set relativenumber

" Show cursor position.
set ruler

" Show colored column.
set colorcolumn=80

" Highlight current line.
set cursorline

" Show current command.
set showcmd

" Show matching brackets.
set showmatch

" Highlight search matches.
set hlsearch

" Always show status line.
set laststatus=2

"
" COLOR
"

" Enable syntax highlighting.
syntax on
set background=dark

colorscheme gruvbox

"
" INPUT
"

" Leader key.
let mapleader=' '
nnoremap <space> <nop>

" Disable search match highlighting.
map <leader>h :nohlsearch<CR>

" Enable full mouse usage.
set mouse=a

"
" FILE
"

" Disable swapfiles.
set noswapfile


"
" PLUGIN
"

