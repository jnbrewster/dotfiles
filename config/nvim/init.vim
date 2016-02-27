"
" Plugins
"

call plug#begin('~/.config/nvim/plugged')
" Pandoc / Markdown
Plug 'vim-pandoc/vim-pandoc', { 'for': [ 'pandoc', 'markdown' ] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': [ 'pandoc', 'markdown' ] }

" General
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'Raimondi/delimitMate'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()

" Plugin settings
autocmd! BufWritePost * Neomake

" Tab settings
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab

" Set focused line to be 0
set relativenumber

" Remove auto comments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set theme
set background=dark
colorscheme solarized

"
" Remaps
"

" Search for files in fzf.
nnoremap <Leader>f :FZF<CR>

" Search history with fzf.
nmap <silent> <leader>h :History<CR>

" Add keybindings to add located files to a new tab or to splits.
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

