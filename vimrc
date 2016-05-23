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

Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'ap/vim-css-color'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'itspriddle/vim-javascript-indent'
Plug 'jelera/vim-javascript-syntax'
Plug 'joelbrewster/Tomorrow'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'mattn/emmet-vim/'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rails'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


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

" Set backspaces
set backspace=indent,eol,start


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

" Set title in terminal
set title

" minimize resizing
set noequalalways

" Set font and size.
set guifont=Fira\ Code:h14

" Set colors
hi LineNr         ctermbg=NONE    ctermfg=0       cterm=NONE
hi CursorLineNr   ctermbg=NONE    ctermfg=3       cterm=NONE
hi TabLine        ctermbg=black   ctermfg=white   cterm=NONE
hi TabLineFill    ctermbg=black   ctermfg=white   cterm=NONE
hi TabLineSel     ctermbg=black   ctermfg=yellow
hi VertSplit      ctermbg=black   ctermfg=black   cterm=NONE
hi StatusLineNC   ctermbg=black   ctermfg=white   cterm=NONE
hi StatusLine     ctermbg=black   ctermfg=yellow  cterm=NONE
hi Folded         ctermbg=black   ctermfg=green
hi ModeMsg        ctermbg=green   ctermfg=black   cterm=NONE
hi Search         ctermbg=yellow  ctermfg=NONE

set background=dark
colo tomorrow-night

" Statusline
set laststatus=2

" Hide mode
set noshowmode

" Light line info
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "*"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction


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
nnoremap <Leader>e :Ex<CR>
nnoremap <C-e> :Ex <CR>

" FZF search
nnoremap <Leader>f :FZF<CR>

" Make netrw sexier
let g:netrw_liststyle=3

" Emmet keys
let g:user_emmet_leader_key = '<c-e>'

" Save
nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :w<CR>
nnoremap <C-w>:w <CR>
nnoremap <C-s>:w <CR>

" Lost focus save
autocmd FocusLost * nested silent! wa

" Quit
nnoremap <Leader>q :q<CR>
nnoremap <C-q> :q <CR>

" Arrowkeys resize viewports.
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" Resource vimrc
nnoremap <Leader>r :so %<CR>
nnoremap <C-r> :so % <CR>

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

"FZF search
set rtp+=/usr/local/opt/fzf

" Disable swapfiles.
set noswapfile

" Search current folder recursively for searching (via :find)
set path=$PWD/**

" Fix up indents
filetype plugin indent on

" Fix indenting on save
filetype indent on
set smartindent

" Remove auto comments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove whitespaces on save.
autocmd BufWritePre * :%s/\s\+$//e

" Javascript auto complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Syntastic interface
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=1

