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
Plug 'itchyny/lightline.vim'
Plug 'itspriddle/vim-javascript-indent'
Plug 'jelera/vim-javascript-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'joelbrewster/Tomorrow'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
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
Plug 'valloric/MatchTagAlways'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'evidens/vim-twig'

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

" Set wildmenu for matches on ctrl-n/p and wild searches
set wildmenu

" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

" Remove auto comments from next line with enter, o or O.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove whitespaces on save.
autocmd BufWritePre * :%s/\s\+$//e

" Set spelling for markdown and wiki files
autocmd BufRead,BufNewFile *.wiki setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell

" Change filetype for wiki files to be markdown
autocmd BufNewFile,BufFilePre,BufRead *.wiki set filetype=markdown

" Ignore stuff
set wildignore+=*.o,*.obj,.git,node_modules,_site,*.class,*.zip,*.aux

" Netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" -------------------------------------------------------------------------
" Visual
" -------------------------------------------------------------------------

" Theme stuff
if has("gui_running")
  set guifont=SF\ Mono:h13
  set linespace=3
  let g:seoul256_background = 234
  " Change time based on time of day for guivim
  " if strftime("%H") < 19
  "   set background=light
  " else
  "   set background=dark
  " endif
  else
  let g:seoul256_background = 235
endif

" Colorscheme stuff
set background=dark
colorscheme seoul256

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

"Lightline
let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ 'active': {
  \   'left': [ [ 'filename' ],
  \             [ 'readonly', 'fugitive' ] ],
  \   'right': [ [ 'percent', 'lineinfo' ],
  \              [ 'fileencoding', 'filetype' ],
  \              [ 'fileformat', 'syntastic' ] ]
  \ },
  \ 'component_function': {
  \   'modified': 'Mod',
  \   'readonly': 'RO',
  \   'fugitive': 'Git',
  \   'filename': 'Name',
  \   'filetype': 'Type',
  \   'fileformat' : 'Format',
  \   'fileencoding': 'Encoding',
  \   'mode': 'Mode',
  \ },
  \ 'component_expand': {
  \   'syntastic': 'ALEGetStatusLine',
  \ },
  \ 'component_type': {
  \   'syntastic': 'error',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

function! Mod()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '»' : &modifiable ? '' : ''
endfunction

function! RO()
  return &ft !~? 'help\|vimfiler' && &readonly ? 'x' : ''
endfunction

function! Git()
  if &ft !~? 'help\|vimfiler' && exists("*fugitive#head")
    return fugitive#head()
  endif
  return ''
endfunction

function! Name()
  return ('' != Mod() ? Mod() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[none]')
endfunction

function! Type()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
endfunction

function! Format()
  return ''
endfunction

function! Encoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &enc : &enc) : ''
endfunction

" Remove elements for guivim.
if exists("+guioptions")
  set go-=m   " menu bar
  set go-=T   " toolbar
  set go-=r   " right scrollbar
  set go-=L   " left scrollbar
" set go-=e   " remove gui tabs
  set go-=tc  " tearoff menu items and small popup dialogs
endif


" brighten/dim background with macOS dim screen function keys
" 233 (darkest) ~ 239 (lightest) 252 (darkest) ~ 256 (lightest)
function! Seoul256Brighten()
    if g:seoul256_background == 239
        let g:seoul256_background = 252
    elseif g:seoul256_background == 256
        let  g:seoul256_background = 256
    else
        let g:seoul256_background += 1
    endif
    colo seoul256
endfunction

function! Seoul256Dim()
    if g:seoul256_background == 252
        let g:seoul256_background = 239
    elseif g:seoul256_background == 233
        let g:seoul256_background = 233
    else
        let g:seoul256_background -= 1
    endif
    colo seoul256
endfunction

nmap <F1> :call Seoul256Dim()<CR>
nmap <F2> :call Seoul256Brighten()<CR>


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
" let g:vimwiki_list = [{'path': '/Volumes/Home/Dropbox/Documents'}]

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

" FZF preview addition
let g:fzf_files_options =
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

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
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '-'
let g:ale_statusline_format = ['x %d', '/ %d', '⬥ ok']
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_javascript_eslint_use_global = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" Match tags in file
let g:mta_use_matchparen_group = 1

