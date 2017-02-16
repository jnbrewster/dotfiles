" -------------------------------------------------------------------------
" ~/.vimrc
" -------------------------------------------------------------------------

" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif


" -------------------------------------------------------------------------
" Plugins
" -------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ajh17/Spacegray.vim'
Plug 'ap/vim-css-color', {'for': ['css', 'scss']}
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dkprice/vim-easygrep'
Plug 'ggreer/the_silver_searcher'
Plug 'itspriddle/vim-javascript-indent'
Plug 'jelera/vim-javascript-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'joelbrewster/Tomorrow'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'kshenoy/vim-signature'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim/'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 't9md/vim-choosewin'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'

call plug#end()


" -------------------------------------------------------------------------
" Settings
" -------------------------------------------------------------------------

" Disable swapfiles.
set noswapfile

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

" Highlight current line.
set cursorline

" Show relative cursor number.
set relativenumber
set number

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

" Word completion
set complete+=kspell

" Set wildmenu for matches on ctrl-n/p
set wildmenu

" Remove auto comments from next line with enter, o or O.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove whitespaces on save.
autocmd BufWritePre * :%s/\s\+$//e

" Set spelling for markdown and wiki files
autocmd BufRead,BufNewFile *.wiki setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell

" Ignore stuff
set wildignore+=*.o,*.obj,.git,node_modules,_site,*.class,*.zip,*.aux

" -------------------------------------------------------------------------
" Visual
" -------------------------------------------------------------------------

" Theme stuff
if has("gui_running")
  set guifont=SF\ Mono:h12
  " Change time based on time of day for guivim
  if strftime("%H") < 19
    colorscheme Tomorrow
    set background=light
  else
    colorscheme Tomorrow-Night
    set background=dark
  endif
  " Set terminal theme
else
  colorscheme Tomorrow-Night
  set background=dark
endif

" Show list characters
set list listchars=tab:»·,trail:·

" Fall back statusline
set statusline=[%n]\ %F
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %{ALEGetStatusLine()}
set statusline+=%=
set statusline+=%(\[%{&fenc}\,%)
set statusline+=%(\ %{&ft}]\%)
set statusline+=\ [%l\:%c]
set laststatus=2

" Powerline setup
function! AirlineInit()
endfunction

if !exists('g:airline_powerline_fonts') " Unicode fallback if no powerline font
  let g:airline_symbols={} " Define symbols dictionary
  let g:airline_left_sep=''
  let g:airline_right_sep=''
  let g:airline_symbols.linenr='㏑'
  let g:airline_symbols.maxlinenr='☰'
  let g:airline_symbols.branch='ᚠ'
  let g:airline_symbols.whitespace='☲'
endif

" Hide the mode that is shown using Powerline
set noshowmode

" Remove elements for guivim.
if exists("+guioptions")
  set go-=m   " menu bar
  set go-=T   " toolbar
  set go-=r   " right scrollbar
  set go-=L   " left scrollbar
" set go-=e   " remove gui tabs
  set go-=tc  " tearoff menu items and small popup dialogs
endif


" -------------------------------------------------------------------------
" Bindings and plugin settings
" -------------------------------------------------------------------------

" Remap leader
let mapleader      = ' '
let maplocalleader = ' '

" Emmet keys
let g:user_emmet_leader_key = '<c-e>'

" Resource vimrc
nnoremap <Leader>r :so %<CR>
nnoremap <C-r> :so % <CR>

" Vimwiki location
let g:vimwiki_list = [{'path': '/Volumes/Home/Dropbox/Documents'}]

" Export all Vim Wiki pages as html
nnoremap <Leader>we :VimwikiAll2HTML<CR>

" Insert the date and 24hr time.
nnoremap <Leader>da :r! date "+ \%b \%d, \%Y, \%H:\%M"<CR>

" Insert a line for wiki stuff
nnoremap <Leader>li i-------------------------------------------------------------------------<CR>

" Load Goyo for writing.
nnoremap <Leader>go :Goyo 50%<CR>

" Load :Lex and :Ex
nnoremap <Leader>e :Ex<CR>
nnoremap <C-e> :Lex <CR>

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

" toggle spellcheck
nnoremap <leader>sc :setlocal spell!<CR>

" Support flow types syntax
let g:javascript_plugin_flow = 1

" Don't need extension for jsx
let g:jsx_ext_required = 0

" -------------------------------------------------------------------------
" Syntax
" -------------------------------------------------------------------------
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_javascript_eslint_use_global = 1

