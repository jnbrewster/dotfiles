"
" ~/.vimrc
"

"
" Plugins
"

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'itspriddle/vim-javascript-indent'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-pathogen'
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'

call plug#end()

" execute pathogen#infect()


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

" Set font and size.
set guifont=Input\ Mono:h13

" Set colorscheme to change based on time with gui.
if strftime("%H") < 17 && has('gui_running')
    colorscheme Tomorrow
    set background=light
else
    colorscheme Tomorrow-Night
    set background=dark
endif



"
" INPUT
"

" Enable full mouse usage.
set mouse=a

" These are annoying sometimes
" " Automatically match closing curly bracket.
" inoremap {<cr>  {<cr>}<esc>O<tab>
"
" " Automatically match square brackets.
" inoremap [<cr>  [<cr>]<esc>O<tab>

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

" Easy align interactive.
vnoremap <silent> <Enter> :EasyAlign<cr>

" Edit remind
nnoremap <Leader>r :e ~/.reminders<CR>

" Edit todo
nnoremap <Leader>t :e ~/vimwiki/todo.wiki<CR>


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
set spell
set mousemodel=popup

" Set certain file extensions to use markdown formatting.
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md,*txt,*wiki  set ft=markdown

" Javascript auto complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
