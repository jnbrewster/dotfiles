"#vimrc
call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'

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
" font and theme(from profile)
set t_Co=256
set guifont=Source\ Code\ Pro:h13
execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME
hi cursorLine cterm=NONE

" statusline
set statusline+=%1*
set statusline+=
set laststatus=2
" file name
set statusline+=%F
" extend space to the right
set statusline+=%=
" file type
" set statusline+=%y
" row numbers and column
set statusline+=[%l:%L:%c]


"#---------------------------------------
"# conditionals
"#---------------------------------------
if has("gui_running")
	colorscheme seoul256
end

" autoreload vimrc after :w
augroup myvimrc
		au!
		au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC| if has('gui_running') | so $MYGVIMRC | endif
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
set linebreak
set nolist
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
set copyindent
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

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3

" block cursor on visual mode
set gcr=n-v-c:block-Cursor



