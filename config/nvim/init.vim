" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim'
Plug 'ap/vim-css-color'
Plug 'benekastah/neomake'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-pandoc/vim-pandoc', { 'for': [ 'pandoc', 'markdown' ] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': [ 'pandoc', 'markdown' ] }
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

" Set colortheme
hi CursorLine      ctermbg=0    ctermfg=NONE  cterm=NONE
hi LineNr          ctermbg=NONE ctermfg=0     cterm=NONE
hi CursorLineNr    ctermbg=NONE ctermfg=3     cterm=NONE
hi TabLine         ctermbg=15  ctermfg=0      cterm=NONE
hi TabLineFill     ctermbg=15  ctermfg=239    cterm=NONE


" Change the background to dark or light depending upon the time 7-7
if strftime("%H") >= 7 && strftime("%H") < 19
  set background=light
else
  set background=dark
endif

" Search for files in fzf.
nnoremap <Leader>f :FZF<CR>

" Search history with fzf.
nmap <silent> <leader>h :History<CR>

" Keybindings to add located files to a new tab or to splits.
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Set txt files to load like markdown
au! BufRead,BufNewFile *.md set filetype=markdown
au! BufRead,BufNewFile *.txt set filetype=markdown

