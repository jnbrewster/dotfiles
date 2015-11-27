"
" ~/.vimrc
"

"
" Plugins
"

"auto-install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'
Plug 'junegunn/goyo.vim'
Plug 'kien/ctrlp.vim'
Plug 'plasticboy/vim-markdown'

call plug#end()


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

" Remaps for moving around tabs.
nnoremap tn :tabnew<Space>

nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>


"
" UI
"

" Hide toolbar and scrollbars in macvim
set guioptions-=T
set guioptions-=r
set guioptions-=L

" Set the vertical fillcharacter
set fillchars+=vert:│

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

" Redraw screen quicker.
set ttyfast
set lazyredraw

" Remove fill characters
set fillchars=""

" Set font and size.
set guifont=Fira\ Mono\ OT:h13

" Set theme.
colorscheme seoul256

" Set shortcuts to change theme.
function Dark ()
  colorscheme seoul256
endfunction

function Light ()
  colorscheme seoul256-light
endfunction

map <silent> <leader>1  :call Dark()<CR>
map <silent> <leader>2  :call Light()<CR>


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
inoremap <expr> '' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> "" strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

" Insert the date and 24hr time.
nnoremap <Leader>t :r! date "+ \%b \%d, \%Y, \%H:\%M"<CR>

" Load Goyo for writing.
nnoremap <Leader>g :Goyo 50%<CR>

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



