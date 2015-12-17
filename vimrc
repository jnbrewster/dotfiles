"
" ~/.vimrc
"

"
" Plugins
"

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'plasticboy/vim-markdown'

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
nnoremap tn :tabnew<Space>

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

" Set font and size.
set guifont=Input:h13

" Set colorscheme.
colorscheme smyck


"
" INPUT
"

" Enable full mouse usage.
set mouse=a

" Remove these if you don't use them...
" Automatically match brackets.
" inoremap        (  ()<Left>
" inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
"
" " Automatically match square brackets.
" inoremap        [  []<Left>
" inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" Automatically match closing curly bracket.
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O<TAB>
inoremap {{     {
inoremap {}     {}

" Automatically match single and double quotes.
inoremap <expr> '' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> "" strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

" Insert the date and 24hr time.
nnoremap <Leader>t :r! date "+ \%b \%d, \%Y, \%H:\%M"<CR>

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

" Easy align interactive.
vnoremap <silent> <Enter> :EasyAlign<cr>


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

" Enable spellchecking for Markdown files and git commit messages.
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" Set certain file extensions to use markdown formatting.
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md,*txt  set ft=markdown
