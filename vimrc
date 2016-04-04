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
set guifont=Input:h14

if has ('gui_running')
  colo spacegray
end

set laststatus=2
" Change the background to dark or light depending upon the time 7-7
"if has ('gui_running')
"if strftime("%H") >= 7 && strftime("%H") < 19
"  colorscheme Tomorrow
"  set background=light
"else
"  colorscheme Tomorrow-Night
"  set background=dark
"endif
"    colorscheme Tomorrow-Night
"    set background=dark
" endif

"
" Theme
"

hi CursorLine      ctermbg=0    ctermfg=NONE   cterm=NONE
hi LineNr          ctermbg=NONE ctermfg=240    cterm=NONE
hi TabLine         ctermbg=15   ctermfg=0      cterm=NONE
hi TabLineFill     ctermbg=15   ctermfg=239    cterm=NONE
hi Pmenu           ctermbg=235  ctermfg=137    cterm=NONE
hi PmenuSel        ctermbg=234  ctermfg=196    cterm=NONE
hi PmenuSbar       ctermbg=235  ctermfg=000    cterm=NONE
hi PmenuThumb      ctermbg=235  ctermfg=137    cterm=NONE
hi Todo            ctermbg=NONE ctermfg=NONE   cterm=NONE
hi IncSearch       ctermbg=9    ctermfg=0      cterm=NONE
hi Search          ctermbg=2    ctermfg=232    cterm=NONE



"
" INPUT
"

" Enable full mouse usage.
set mouse=a

" Insert the date and 24hr time.
nnoremap <Leader>d :r! date "+ \%b \%d, \%Y, \%H:\%M"<CR>

" Load Goyo for writing.
nnoremap <Leader>g :Goyo 50%<CR>

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

" Auto close brackets
inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {, {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [; [<CR>];<Esc>O
inoremap [, [<CR>],<Esc>O


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

" Use todo#complete as the omni complete function for todo files
" au filetype todo setlocal omnifunc=todo#complete

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

