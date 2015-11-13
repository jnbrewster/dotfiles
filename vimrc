"
" ~/.vimrc
"


"
" GENERAL
"


" Set paste when pasting, set no paste when done.
set pastetoggle=

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

" Start searching before pressing enter.
set incsearch

" Remap split term movement to Esc
tnoremap <Esc> <c-\><c-n>


"
" UI
"

" Hide toolbar and scrollbars in macvim
set guioptions-=T
set guioptions-=r
set guioptions-=L

" Show line numbers.
set relativenumber

" Show cursor position.
set ruler

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

" Simple font for macvim
set guifont=Droid\ Sans\ Mono:h13


"
" INPUT
"

" Disable search match highlighting.
map <leader>h :nohlsearch<CR>

" Enable full mouse usage.
set mouse=a

" match closing curly bracket.
inoremap { {<CR>}<Esc>O<TAB>


"" Match closing bracket.
"inoremap ( ()<Esc>i
"
"" Match closing square bracket.
"inoremap [ []<Esc>i

"
" FILE
"

" Disable swapfiles.
set noswapfile

" Remove auto comments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove whitespaces on save.
autocmd BufWritePre * :%s/\s\+$//e


