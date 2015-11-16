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


"
" COLOR
"

" Enable syntax highlighting.
syntax on

" Simple font for macvim
set guifont=Source\ Code\ Pro:h14
let hour = strftime("%H")
if 7 <= hour && hour < 19
  colorscheme Tomorrow
else
  colorscheme Tomorrow-Night
endif


"
" INPUT
"

" Enable full mouse usage.
set mouse=a

" Match closing curly bracket.
inoremap { {<CR>}<Esc>O<TAB>


"
" FILE
"

" Disable swapfiles.
set noswapfile

" Remove auto comments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove whitespaces on save.
autocmd BufWritePre * :%s/\s\+$//e


"set laststatus=2
"set statusline=%F%m%r%h%w\ [%l/%L,\ %v]\ [%p%%]\ %=[TYPE=%Y]\ [FMT=%{&ff}]\ %{\"[ENC=\".(&fenc==\"\"?&enc:&fenc).\"]\"}
