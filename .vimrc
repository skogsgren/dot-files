" init plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" true color in TMUX
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

call plug#begin()

" ===========
" BASIC STUFF
" ===========

" leader key
let mapleader=" "
let maplocalleader=" "
set timeoutlen=500

syntax on
set encoding=utf-8
set nocompatible
set splitbelow splitright
set number relativenumber  " relative line numbers
" enable undo for all files
    set undodir=~/.vim/undodir
    set undofile
set clipboard=unnamedplus  " unite clipboards
set laststatus=2  " statusline
set backspace=indent,eol,start  " proper backspace behavior
if has("termguicolors")
    set termguicolors
endif
set pastetoggle=<Insert>  " sane pastetoggle keyboard shortcut
set hls  " highlight search matches
set hidden  " allows switching buffers without saving

" the bells, oh the bells!
set noerrorbells visualbell t_vb=

" swe/eng keyboard
nnoremap Ö :
nnoremap ½ ~

" indentation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" ctags optimization
set autochdir
set tags=tags;

" clear search highlighting shortcut
nnoremap <CR> :noh<CR><CR>

" remap Q to fit current paragraph with gq
nnoremap Q movipgq`o

Plug 'tpope/vim-commentary'  " commentary aid
    autocmd FileType php setlocal commentstring=//\ %s
    nnoremap <C-c> :Commentary<CR>
    vnoremap <C-c> :Commentary<CR>

call plug#end()

" spell checker with keybinding <C-l>
function! s:spellHelper(lang)
    let $LANG = a:lang
    set spell! spelllang=$LANG
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
endfunction
command! Svspell call s:spellHelper("sv")
command! Enspell call s:spellHelper("en_us")

" ignore common errors (need to come last)
cabbr W w
cabbr Q q
cabbr Wq wq
cabbr WQ wq

au FileType plain,txt,markdown,tex setlocal tw=79 colorcolumn=81
