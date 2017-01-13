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
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'ap/vim-css-color', {'for': ['css', 'scss']}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidoc/taskpaper.vim'
Plug 'dkprice/vim-easygrep'
Plug 'ggreer/the_silver_searcher'
Plug 'itspriddle/vim-javascript-indent'
Plug 'jelera/vim-javascript-syntax'
Plug 'joelbrewster/Tomorrow'
Plug 'joelbrewster/vim-quantum'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'kshenoy/vim-signature'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim/'
Plug 'rakr/vim-one'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 't9md/vim-choosewin'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-vinegar'
Plug 'vimwiki/vimwiki'

call plug#end()


" Remap leader
let mapleader      = ' '
let maplocalleader = ' '

" Share the clipboard outside of vim
set clipboard=unnamed

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

" Remove auto comments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove whitespaces on save.
autocmd BufWritePre * :%s/\s\+$//e

" Fuzzy finder stuff
nnoremap <leader>p :CtrlP<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <leader>f :Ag<CR>
nnoremap <leader>h :History<CR>
nnoremap <Leader><Space> :History<CR>
nnoremap <leader>b :Buffer<CR>

" Remap change tabs
nnoremap K gT
nnoremap J gt

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

" Search as typing
set incsearch

" Ignore case when search
set ignorecase

" Theme stuff
if has("gui_running")
  set background=dark
  colorscheme Tomorrow-Night
endif

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

set guifont=SF\ Mono:h12

" Hide statusline with only 1 window
set laststatus=2

" Spelling
autocmd BufRead,BufNewFile *.wiki setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell

" Word completion
set complete+=kspell

" Disable swapfiles.
set noswapfile

" Emmet keys
let g:user_emmet_leader_key = '<c-e>'

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

" Vimwiki location
let g:vimwiki_list = [{'path': '~/Dropbox/Documents'}]

"Todo location
nnoremap <Leader>tt :tabe ~/Dropbox/todo.taskpaper<CR>
nnoremap <Leader>ss :tabe ~/Dropbox/shopping.taskpaper<CR>

" Export all Vim Wiki pages as html
nnoremap <Leader>we :VimwikiAll2HTML<CR>

" Enable full mouse usage.
set mouse=a

" Insert the date and 24hr time.
nnoremap <Leader>da :r! date "+ \%b \%d, \%Y, \%H:\%M"<CR>

" Insert a line
nnoremap <Leader>li i-------------------------------------------------------------------------<CR>

" Load Goyo for writing.
nnoremap <Leader>go :Goyo 50%<CR>

" Load :Lex and :Ex
nnoremap <Leader>e :Ex<CR>
nnoremap <C-e> :Lex <CR>
nnoremap <C-\>e :ex<CR>

" Syntax stuff
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height=5

let g:syntastic_html_tidy_ignore_errors=['proprietary attribute "ng-']
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

" use jshint
let g:syntastic_javascript_checkers = ['jshint']

" show any linting errors immediately
let g:syntastic_check_on_open = 1

" Set up the arrays to ignore for later
if !exists('g:syntastic_html_tidy_ignore_errors')
  let g:syntastic_html_tidy_ignore_errors = []
endif

if !exists('g:syntastic_html_tidy_blocklevel_tags')
  let g:syntastic_html_tidy_blocklevel_tags = []
endif

" Statusline
set statusline=\ %F%m%r%h
set statusline+=\ %{fugitive#statusline()}
set statusline+=%=
set statusline+=\ [%l\:%c]
set laststatus=2

" Colors for term
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
hi StatusLine     ctermbg=NONE      ctermfg=blue       cterm=NONE
hi StatusLineNC   ctermbg=NONE      ctermfg=black       cterm=NONE
hi TabLine        ctermbg=NONE      ctermfg=black       cterm=NONE
hi TabLineFill    ctermbg=NONE      ctermfg=black       cterm=NONE
hi TabLineSel     ctermbg=NONE      ctermfg=blue
hi VertSplit      ctermbg=NONE      ctermfg=black       cterm=NONE
hi visual         ctermbg=yellow     ctermfg=black
hi PMenuSel       ctermfg=black ctermbg=white
hi PMenu           ctermbg=black ctermfg=white
hi Question       ctermfg=magenta
hi Underlined     ctermfg=NONE
hi WarningMsg     ctermfg=red

hi Boolean        ctermfg=yellow
hi Character      ctermfg=red
hi Comment        ctermfg=magenta
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

hi cssBraces      ctermfg=green
hi cssClassName   ctermfg=magenta
hi cssColor       ctermfg=cyan

hi javascriptBraces   ctermfg=green
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

hi SpellBad       ctermfg=black       ctermbg=red
hi SpellLocal     ctermfg=yellow
hi SpellCap       ctermfg=yellow
hi SpellRare      ctermfg=green
