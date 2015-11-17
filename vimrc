"
" ~/.vimrc
"


"
" GENERAL
"

" Load bash.
set shell=/bin/bash\ -i

" Share the clipboard outside of vim
set clipboard=unnamed

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

" Change order of default splits.
set splitbelow
set splitright


"
" COLOR
"

" Enable syntax highlighting.
syntax on

" Set font and size.
set guifont=Input:h13

" Set theme based on time (7am - 5pm)
let hour = strftime("%H")
if 7 <= hour && hour < 17
  colorscheme seoul256-light
else
  colorscheme seoul256
endif


"
" INPUT
"

" Enable full mouse usage.
set mouse=a

" Automatically match brackets.
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

" Automatically match square brackets.
inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" Automatically match closing curly bracket.
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O<TAB>
inoremap {{     {
inoremap {}     {}

" Automatically match single and double quotes.
" Need to fix the single quote for when using abbreviations.
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

" Arrowkeys resize viewports.
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>


"
" FILE
"

" Disable swapfiles.
set noswapfile

" Remove auto comments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove whitespaces on save.
autocmd BufWritePre * :%s/\s\+$//e

" Enable spellchecking for Markdown files and git commit messages.
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
