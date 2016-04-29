"
" ~/.vimrc
"

" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif


"
" Plugins
"

call plug#begin('~/.vim/plugged')

Plug 'FelikZ/ctrlp-py-matcher'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'itspriddle/vim-javascript-indent'
Plug 'jelera/vim-javascript-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/goyo.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby'
Plug 'joelbrewster/Tomorrow'
Plug 'tpope/vim-pathogen'

"call pathogen#infect()


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

" Remap leader
let mapleader      = ' '
let maplocalleader = ' '

" Remaps for moving around tabs with right hand.
noremap tn :tabnew<Space>

nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Highlight current line.
set cursorline

" Show relative cursor number.
set relativenumber

" set folding
set foldmethod=manual

" Show current command.
set showcmd

" Highlight search matches.
set hlsearch

" Enable syntax highlighting.
syntax on

" Redraw screen quicker.
set ttyfast
set lazyredraw

" Remove fill characters
set fillchars=""

" Remove elements.
if exists("+guioptions")
  set go-=m   " menu bar
  set go-=T   " toolbar
  set go-=r   " right
  set go-=L   " left
  set go-=a   " no autoselect to * register
  set go-=e   " always use text-style tabs
  set go-=tc  " tearoff menu items and small popup dialogs
endif

" Set font and size.
set guifont=Input:h13

" Change the background to dark or light depending upon the time 7-7
" if strftime("%H") >= 6 && strftime("%H") < 17
"   "&& has("gui_running")
"   colorscheme Tomorrow
"   set background=light
" else
  colorscheme Tomorrow-Night
  set background=dark
" endif


"
" INPUT
"

" Enable full mouse usage.
set mouse=a

" Insert the date and 24hr time.
nnoremap <Leader>d :r! date "+ \%b \%d, \%Y, \%H:\%M"<CR>

" Load Goyo for writing.
nnoremap <Leader>g :Goyo 50%<CR>

" Load :Ex
nnoremap <Leader>\ :Ex<CR>

" Save
nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :w<CR>

" Quit
nnoremap <Leader>q :q<CR>

" Arrowkeys resize viewports.
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" Search for files in fzf.
nnoremap <Leader>f :FZF<CR>

" Search history with fzf.
nmap <silent> <leader>h :History<CR>

" Add keybindings to add located files to a new tab or to splits.
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Speed up ctrlP
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Resource vimrc
nnoremap <Leader>r :so %<CR>

" New tab bind
nmap <leader>t :tabe<CR>

" Does delimitMate work better?
" Auto close brackets
inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {, {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [; [<CR>];<Esc>O
inoremap [, [<CR>],<Esc>O

noremap ,cc :<C-B>silent <C-E>s/\V\.\*/\=
            \printf(&commentstring,getline("."))/<CR>
            \:nohlsearch<CR>
noremap ,cu :<C-B>silent <C-E>s/\V\^<C-R>=
            \escape(get(split(&commentstring,'%s'),0,''),'\/').'\\|'.
            \escape(get(split(&commentstring,'%s'),1,''),'\/')
            \<CR>\$//g<CR>
            \:nohlsearch<CR>

"
" FILE
"

" Disable swapfiles.
set noswapfile

" Search current folder recursively for searching (via :find)
set path+=**

" Fix up indents
filetype plugin indent on

" Remove auto comments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove whitespaces on save.
autocmd BufWritePre * :%s/\s\+$//e

" Javascript auto complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_loc_list_height=3

