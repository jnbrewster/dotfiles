set autoindent
set backspace=indent,eol,start
set clipboard=unnamed
set expandtab
set foldmethod=manual
set relativenumber
set shiftwidth=2
set softtabstop=2
set tabstop=2
syntax on
set autoindent 

" Various adjustments of the default colorscheme
hi CursorLineNr   ctermbg=NONE      ctermfg=yellow         
hi LineNr         ctermbg=NONE      ctermfg=black         
hi ModeMsg        ctermbg=green     ctermfg=black     cterm=NONE
hi Search         ctermbg=yellow    ctermfg=black
hi StatusLineNC   ctermbg=black
hi VertSplit      ctermbg=black     ctermfg=black        
hi Visual         ctermbg=white     ctermfg=darkblue


" Insert the date and 24hr time.
nnoremap <Leader>d :r! date "+ \%b \%d, \%Y, \%H:\%M"<CR>

" Auto close brackets
inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {, {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [; [<CR>];<Esc>O
inoremap [, [<CR>],<Esc>O
