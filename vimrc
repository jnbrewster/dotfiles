"
" ~/.vimrc
"

"
" Plugins
"

call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itspriddle/vim-javascript-indent'
Plug 'jelera/vim-javascript-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/goyo.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ryanss/vim-hackernews'

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

" Remove the scrollbars.
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "right
set guioptions-=L  "left

" Show airline tabs and status line
let g:airline#extensions#tabline#enabled = 1

set laststatus=2
let g:airline_powerline_fonts = 0
set noshowmode

" Straight tabs
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''


" Remove the silly arrows
let g:airline_left_sep=''
let g:airline_right_sep=''

" Set font and size.
set guifont=Input\ Mono:h13

" Set colorscheme to solarized
colorscheme Tomorrow-Night
set background=dark

" Change the background to dark or light depending upon the time
function! SetColorscheme()
  if strftime("%H") >= 7 && strftime("%H") < 19
    colorscheme Tomorrow
    set background=light
  else
    colorscheme Tomorrow-Night
    set background=dark
  endif
endfunction

" Every time you save a file, call the function to check the time and change
" the background (if necessary).
" if has("autocmd")
"     autocmd bufwritepost * call SetColorscheme()
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

" Mapping to change between solarized backgrounds
call togglebg#map("<leader>s")

" Hacker news - totally useless but awesome
nnoremap <Leader>h :HackerNews<CR>

" Todo list shortcut
nnoremap <Leader>t :e ~/Dropbox/todo.txt<CR>


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

" Javascript auto complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au! BufRead,BufNewFile *.md set filetype=markdown
au! BufRead,BufNewFile *.txt set filetype=markdown

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

