call plug#begin('~/.config/nvim/plugged')

Plug 'ap/vim-css-color'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'kien/ctrlp.vim'

call plug#end()

"
" ~/.config/nvim/init.vim
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

" Change order of default splits.
set splitbelow
set splitright

" Remap split term movement to Esc
tnoremap <Esc> <c-\><c-n>


"
" UI
"

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

" Enable syntax highlighting.
syntax on

" Set background color"
let g:seoul256_background = 235
let g:seoul256_light_background = 256

" Set theme
colo seoul256
colo seoul256-light

" Set shortcuts to change theme.
function Dark ()
  colorscheme seoul256
endfunction

function Light ()
  colorscheme seoul256-light
endfunction

map <silent> <leader>1  :call Dark()<CR>
map <silent> <leader>2  :call Light()<CR>

" Load Goyo for writing.
nnoremap <Leader>G :Goyo<CR>


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

inoremap ''     '
inoremap ""     "

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

" Search current folder recursively for searching (via :find)
set path+=**

" Remove auto comments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove whitespaces on save.
autocmd BufWritePre * :%s/\s\+$//e

" Enable spellchecking for Markdown files and git commit messages.
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell


