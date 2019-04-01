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

" language
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'

" JavaScript
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'itspriddle/vim-javascript-indent'
Plug 'cdata/vim-tagged-template'

" TypeScript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript'

" Markdown
Plug 'reedes/vim-pencil'
" Needed for vim-markdown
Plug 'godlygeek/tabular',                 { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown',           { 'for': 'markdown' }

" Org
Plug 'jceb/vim-orgmode'

" CSS
Plug 'ap/vim-css-color', {'for': ['css', 'scss']}
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax',            { 'for': 'css' }

" Ruby
Plug 'vim-ruby/vim-ruby',                 { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'

" Search and navigation
Plug 'tpope/vim-vinegar'
Plug 'dkprice/vim-easygrep'
Plug 'ggreer/the_silver_searcher'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-grepper'
Plug 'vim-scripts/ctags.vim'
Plug 'majutsushi/tagbar'
Plug 'haya14busa/incsearch.vim'

" Formatting and snippets
Plug 'tpope/vim-commentary'
Plug 'tommcdo/vim-lion'
Plug 'mattn/emmet-vim/'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'leshill/vim-json'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'

" Interface
Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim'

" Theme
Plug 'joshdick/onedark.vim'
Plug 'joelbrewster/tomorrow'
Plug 'dracula/vim'
Plug 'itchyny/lightline.vim'

call plug#end()

" -------------------------------------------------------------------------
" Auto Commands
" -------------------------------------------------------------------------
" Remove white spaces on save.
autocmd BufWritePre * :%s/\s\+$//e

" Markdown file stuff
autocmd BufRead,BufNewFile *.md set filetype=markdown

autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc set ft=json
au BufNewFile,BufRead *.jsx set filetype=javascript.jsx

au BufRead,BufNewFile *.scss set filetype=scss.css

" Prettier stuff
autocmd FileType javascript set formatprg=prettier\ --stdin


" -------------------------------------------------------------------------
" Settings
" -------------------------------------------------------------------------

" Interactive shell
set shellcmdflag=-ic

" Setup expected backspace behavior
set backspace=indent,eol,start

" Remove bell nonsense
set vb t_vb=

" Disable swapfiles.
set noswapfile

" Share the clipboard outside of vim
set clipboard=unnamed

" Tab width.
set tabstop=2

" Tab width when editing.
set softtabstop=4

" Tab width when indenting in normal mode.
set shiftwidth=4

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

" scss syntax stuff
au BufRead,BufNewFile *.sass set filetype=scss.css

" Ignore stuff
set wildignore+=*.o,*.obj,.git,node_modules,_site,*.class,*.zip,*.aux

" Split order
set splitbelow
set splitright

" Set encoding for dev icons
set encoding=UTF-8


" -------------------------------------------------------------------------
" Visual
" -------------------------------------------------------------------------

" Set Font
set guifont=Operator\ Mono\ Lig:h13

" Add TODO highlight across everything
hi Todo guifg=yellow guibg=NONE ctermbg=yellow ctermbg=NONE

" Use terminal colors for background
hi Normal ctermbg=NONE

if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme onedark

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Show list characters
set list listchars=tab:»·,trail:·

" Fall back statusline
set statusline=[%n]\ %F
set statusline+=\ %{ALEGetStatusLine()}
set statusline+=%=
set statusline+=%(\[%{&fenc}\,%)
set statusline+=%(\ %{&ft}]\%)
set statusline+=\ [%l\:%c]
set laststatus=2
" Hide status - use airline
set noshowmode

" Remove elements for guivim.
if exists("+guioptions")
    set go-=m       " menu bar
    set go-=T       " toolbar
    set go-=r       " right scrollbar
    set go-=L       " left scrollbar
    set go-=e       " remove gui tabs
    set go-=tc      " tear off menu items and small pop up dialogs
endif

" Display extra whitespace characters
set list listchars=tab:»·,trail:·

" -------------------------------------------------------------------------
" Bindings and plugin settings
" -------------------------------------------------------------------------
" Remap leader
let mapleader      = ' '
let maplocalleader = ' '

" Magit for vim
nnoremap <Leader>m :Magit<CR>

" Emmet keys
let g:user_emmet_leader_key = '<c-e>'

" Hide show indent lines
nnoremap <Leader>\ :IndentLinesToggle<CR>

" Load Goyo for writing.
nnoremap <Leader>g :Goyo 50%<CR>

" Load :Lex and :Ex
nnoremap <Leader>e :Ex<CR>
nnoremap <C-e> :Lex <CR>

" Nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

" Nerdtree width
let g:NERDTreeWinSize=60

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
let g:ale_completion_enabled = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '-'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_lint_on_text_changed = 0
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_linter_aliases = {'jsx': 'css'}

