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
Plug 'ap/vim-css-color', {'for': ['css', 'scss']}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dkprice/vim-easygrep'
Plug 'ggreer/the_silver_searcher'
Plug 'itspriddle/vim-javascript-indent'
Plug 'jelera/vim-javascript-syntax'
Plug 'joelbrewster/Tomorrow'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'kshenoy/vim-signature'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim/'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 't9md/vim-choosewin'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
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

" Enable full mouse usage.
set mouse=a

" Theme stuff
if has("gui_running")

  let hour = strftime("%H")
  if 7 <= hour && hour < 19
    set background=light
    colorscheme Tomorrow
  else
    set background=dark
    colorscheme Tomorrow-Night
  endif
endif

colorscheme Tomorrow-Night

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

" Set font for macvim
set guifont=SF\ Mono:h12

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

" Export all Vim Wiki pages as html
nnoremap <Leader>we :VimwikiAll2HTML<CR>

" Insert the date and 24hr time.
nnoremap <Leader>da :r! date "+ \%b \%d, \%Y, \%H:\%M"<CR>

" Insert a line
nnoremap <Leader>li i-------------------------------------------------------------------------<CR>

" Load Goyo for writing.
nnoremap <Leader>go :Goyo 50%<CR>

" Load :Lex and :Ex
nnoremap <Leader>e :Ex<CR>
nnoremap <C-e> :Lex <CR>

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

" Airline stuff
set noshowmode

let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_right_alt_sep = ''
" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = 'Ξ'
let g:airline_symbols.paste = 'ρ'
let g:airline_detect_spell=0
" Airline White Space Handling:
let g:airline#extensions#whitespace#enabled = 1
let g:airline_symbols.whitespace = '□□'

"configure the formatting of the warning messages. >
let g:airline#extensions#whitespace#mixed_indent_format = 'MI[%s]'
let g:airline#extensions#whitespace#trailing_format = 'T[%s]'
" regex for trailing white space, looks for TWO spaces, not one
let g:airline#extensions#whitespace#trailing_regexp = '\s\s$'
" orange for mixed-indent
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing']
let g:airline#extensions#branch#enabled = 0

" File Type File Encoding File Format:
" Tells airline not to display file format
let g:airline_section_x =''
" Tells airline not to display fileencoding or fileformat
let g:airline_section_y =''
" If need to know these then simply do:
" set ff for fileformat
" set fenc for fileencoding
" set ft for filetype

" Airline Short Form Mode Indicators:
" N instead of NORMAL, I instead of INSERT

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'c' : 'C',
      \ 'v' : 'V',
      \ 'V' : 'V',
      \ 's' : 'S',
      \ 'S' : 'S',
      \ }
