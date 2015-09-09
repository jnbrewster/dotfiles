set shell=/bin/sh

"#vimrc
call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'

call plug#end()


"#---------------------------------------
"# displaying text and gui
"#---------------------------------------
set relativenumber
set showmode
set showcmd
set modeline
set ruler
set title
set visualbell
" hide the scrollbars in gui and split
set guioptions-=r
set guioptions-=T
set go-=L
" statusline
" file name
set statusline+=%F
" extend space to the right
set statusline+=%=
" file type
" set statusline+=%y
" row numbers and column
set statusline+=[%l:%L:%c]


"#---------------------------------------
"# colors and theme
"#---------------------------------------
set t_Co=256
let base16colorspace=256
set guifont=Source\ Code\ Pro:h13

if has("gui_running")
	colorscheme seoul256
endif

"let g:seoul256_background = 238
" set vim to use term colors
execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME
hi cursorLine cterm=NONE
hi TabLineFill term=bold cterm=bold ctermbg=black
highlight clear SignColumn

highlight TablineSel		ctermfg=yellow
highlight IncSearch    	ctermbg=white		ctermfg=yellow
highlight Search       	ctermbg=white		ctermfg=red
highlight Visual       	ctermbg=yellow	ctermfg=black
highlight Pmenu				 	ctermbg=yellow	ctermfg=black
highlight VertSplit			ctermbg=black		ctermfg=black
highlight StatusLineNC	ctermbg=white		ctermfg=black
highlight StatusLine		ctermbg=yellow	ctermfg=black

"Conflicting with theme changer script - fix later
"highlight CursorLineNr	ctermbg=black ctermfg=yellow
"highlight LineNr      ctermfg=green
"highlight TabLine			 ctermbg=0 ctermfg=white
"highlight TabLineFill	 ctermbg=0 ctermfg=white
"highlight TablineSel	 ctermbg=0 ctermfg=yellow
"highlight VertSplit    ctermbg=black
"highlight ColorColumn  ctermbg=black
"highlight LineNr       ctermbg=black ctermfg=yellow
"highlight CursorLine   ctermbg=black
"highlight Visual       ctermbg=white ctermfg=red

" highlight the status bar when in insert mode
" if version >= 700
" 	au InsertEnter * hi StatusLine ctermbg=3 ctermfg=black
"   au InsertLeave * hi StatusLine ctermbg=white ctermfg=black
" endif

"#---------------------------------------
"# conditionals
"#---------------------------------------
" autoreload vimrc after :w
augroup reload_vimrc
autocmd!
autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" source vimrc
nmap <leader>, :so $MYVIMRC<CR>


"#--------------------------------------
"# moving around, searching and patterns
"#--------------------------------------
set mouse=a
set incsearch
set ignorecase
set smartcase
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js,smarty/**,vendor/**,node_libraries/**,.git,.local,.hg,.svn,.sass-cache,log,tmp,build,**/ckeditor/**


"#--------------------------------------
"# syntax, highlighting and spelling
"#--------------------------------------
set encoding=utf-8
syntax on
filetype on
filetype plugin on


"#--------------------------------------
"# editing text
"#--------------------------------------
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
set clipboard=unnamed
set noswapfile
set scrolloff=3
set sidescrolloff=5
set sidescroll=1
set cursorline
set wrap
set wrapmargin=8
set linebreak
set nolist
" make insert mode change and drawing faster
set ttimeoutlen=100
set ttyfast
" get vim to read markdown files properly
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" auto comments are stupid
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" autosave on lost focus
au FocusLost * silent! wa
" Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e


"#--------------------------------------
"# tabs, spaces and indenting
"#--------------------------------------
set shiftwidth=2
set softtabstop=2
set tabstop=2
" can backspace through anything in insert mode
set backspace=indent,eol,start
set noai nocin nosi inde=
" leader t for new tab/page
let mapleader = " "
nmap <leader>t :tabe<CR>


"#--------------------------------------
"# folding
"#--------------------------------------
" setlocal foldmethod=indent
set foldmethod=manual


"#--------------------------------------
"# mapping
"#--------------------------------------
" pinky love"
vnoremap <C-c> <Esc>
" bind leader to space
nnoremap <space> <Nop>
let mapleader=" "
" remaps for moving around splits
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l


"#--------------------------------------
"# Plugins
"#--------------------------------------
" Ctrlp
nnoremap <c-\> :CtrlP<CR>
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = 'rw'

" Multi cursor keyboard shortcuts
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Nerdtree mapping
map <C-e> :NERDTreeToggle<CR>


