"
" ~/.vimrc

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
Plug 'itspriddle/vim-javascript-indent'
Plug 'jelera/vim-javascript-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/goyo.vim'
Plug 'mattn/emmet-vim/'
Plug 'pangloss/vim-javascript'
" Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby'
Plug 'joshdick/onedark.vim'
Plug 'digitaltoad/vim-pug'

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
set expandtab

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



"
" VISUAL
"

" Enable syntax highlighting.
syntax on

" Remove fill characters
set fillchars=""

" set list listchars=tab:❘-,extends:»,precedes:«,nbsp:×
" set list

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

" visual
set wildmode=longest:full,full

" Set font and size.
set guifont=Input\ Mono:h12

set linespace=5

" Statusline
set statusline=\ %f%m%r%h
set statusline+=\ %{fugitive#statusline()}
set statusline+=%=
set statusline+=\ [%l\:%c]
set laststatus=2

" Set colors
hi DiffAdd        ctermfg=green
hi DiffChange     ctermfg=black
hi DiffDelete     ctermfg=red
hi DiffText       ctermfg=blue
hi DiffAdded      ctermfg=green
hi DiffFile       ctermfg=red
hi DiffNewFile    ctermfg=green
hi DiffLine       ctermfg=blue
hi DiffRemoved    ctermfg=red

hi CursorLineNr   ctermbg=NONE      ctermfg=yellow      cterm=NONE
hi Folded         ctermbg=NONE      ctermfg=black
hi LineNr         ctermbg=NONE      ctermfg=black       cterm=NONE
hi ModeMsg        ctermbg=NONE      ctermfg=yellow       cterm=NONE
hi Search         ctermbg=yellow    ctermfg=black
hi StatusLine     ctermbg=NONE      ctermfg=white       cterm=NONE
hi StatusLineNC   ctermbg=NONE      ctermfg=black       cterm=NONE
hi TabLine        ctermbg=NONE      ctermfg=black       cterm=NONE
hi TabLineFill    ctermbg=NONE      ctermfg=black       cterm=NONE
hi TabLineSel     ctermbg=NONE      ctermfg=white
hi VertSplit      ctermbg=NONE      ctermfg=black       cterm=NONE
hi visual         ctermbg=black     ctermfg=white
hi PMenuSel       ctermfg=black ctermbg=white
hi PMenu          ctermfg=white ctermbg=black
hi Normal         ctermfg=white
hi Question       ctermfg=magenta
hi Underlined     ctermfg=NONE
hi WarningMsg     ctermfg=red
hi nontext        ctermfg=black
hi MatchParen     ctermfg=white
hi vimBracket     ctermfg=white

hi Boolean        ctermfg=yellow
hi Character      ctermfg=red
hi Comment        ctermfg=black
hi Conditional    ctermfg=magenta
hi Constant       ctermfg=yellow
hi Define         ctermfg=magenta
hi Delimiter      ctermfg=blue
hi Float          ctermfg=yellow
hi Function       ctermfg=blue
hi Identifier     ctermfg=red
hi Include        ctermfg=blue
hi Keyword        ctermfg=magenta
hi Label          ctermfg=yellow
hi Number         ctermfg=yellow
hi Operator       ctermfg=white
hi PreProc        ctermfg=yellow
hi Repeat         ctermfg=yellow
hi Special        ctermfg=cyan
hi SpecialChar    ctermfg=red
hi Statement      ctermfg=red
hi StorageClass   ctermfg=yellow
hi String         ctermfg=green
hi Structure      ctermfg=magenta
hi Tag            ctermfg=yellow
hi Todo           ctermfg=yellow
hi Type           ctermfg=yellow
hi Typedef        ctermfg=yellow

hi htmlBold       ctermfg=yellow
hi htmlItalic     ctermfg=magenta
hi htmlEndTag     ctermfg=white
hi htmlTag        ctermfg=white

hi cssBraces      ctermfg=white
hi cssClassName   ctermfg=magenta
hi cssColor       ctermfg=cyan

hi javascript         ctermfg=white
hi javascriptBraces   ctermfg=white
hi javascriptNumber   ctermfg=yellow

hi markdownCode       ctermfg=black
hi markdownError      ctermfg=red
hi markdownCodeBlock  ctermfg=blue
hi markdownHeadingDelimiter     ctermfg=yellow

hi pythonOperator ctermfg=magenta
hi pythonRepeat   ctermfg=magenta

hi rubyAttribute  ctermfg=blue
hi rubyConstant   ctermfg=yellow
hi rubyInterpolation ctermfg=green
hi rubyInterpolationDelimiter ctermfg=yellow
hi rubyRegexp     ctermfg=cyan
hi rubySymbol     ctermfg=green
hi rubyStringDelimiter ctermfg=green

hi sassidChar     ctermfg=red
hi sassClassChar  ctermfg=yellow
hi sassInclude    ctermfg=magenta
hi sassMixing     ctermfg=magenta
hi sassMixinName  ctermfg=blue

hi SpellBad       ctermfg=red
hi SpellLocal     ctermfg=yellow
hi SpellCap       ctermfg=yellow
hi SpellRare      ctermfg=green

" default
" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P


if has("gui_running")
  colorscheme onedark
  " set background=dark
  set laststatus=0
endif

"
" INPUT
"

" Enable full mouse usage.
set mouse=a

" Insert the date and 24hr time.
nnoremap <Leader>d :r! date "+ \%b \%d, \%Y, \%H:\%M"<CR>

" Load Goyo for writing.
nnoremap <Leader>g :Goyo 50%<CR>

" Load :Lex and :Ex
nnoremap <Leader>e :Lex<CR>
nnoremap <C-e> :Lex <CR>
nnoremap <C-\> :Explore <CR>

" FZF search
nnoremap <Leader>f :FZF<CR>
nnoremap <C-p> :FZF<CR>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
      \   'source':  reverse(<sid>buflist()),
      \   'sink':    function('<sid>bufopen'),
      \   'options': '+m',
      \   'down':    len(<sid>buflist()) + 2
      \ })<CR>

" Make netrw sexier
let g:netrw_liststyle=3

"Tabs
nnoremap <Leader>t :tabe<CR>

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
" autocmd BufRead,BufWritePre *.* normal gg=G

" Remove auto comments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove whitespaces on save.
autocmd BufWritePre * :%s/\s\+$//e

" Javascript auto complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.wiki set filetype=markdown

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Syntastic interface
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_loc_list_height=1

