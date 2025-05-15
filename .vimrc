" init plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
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

set mouse=a " yes, I know

" finding files
set path+=**
set wildmenu

" more comfortable scrolling
set scrolloff=8
nnoremap G Gzz
nnoremap * *zz

" buffer navigation
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
nnoremap <C-b> :ls<CR>:b<Space>

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
set hls  " highlight search matches
set hidden  " allows switching buffers without saving

" the bells, oh the bells!
set noerrorbells visualbell t_vb=

" swe/eng keyboard
nnoremap Ö :
nnoremap ½ ~

" default indentation
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
Plug 'JMcKiern/vim-venter' " center buffer
    autocmd FileType php setlocal commentstring=//\ %s
    autocmd FileType c setlocal commentstring=//\ %s
    nnoremap <C-c> :Commentary<CR>
    vnoremap <C-c> :Commentary<CR>

source $HOME/.vim/prgrm.vim
source $HOME/.vim/lsp.vim
call plug#end()

" spell checker with keybinding <C-l>
function! s:spellHelper(lang)
    let $LANG = a:lang
    set spell! spelllang=$LANG
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
endfunction
command! Svspell call s:spellHelper("sv")
command! Enspell call s:spellHelper("en_us")
command! Gbspell call s:spellHelper("en_gb")

" easy switch from light to dark background
nnoremap <expr><leader>d &background == 'light' ? ':set bg=dark<cr>' : ':set bg=light<cr>'

" ignore common errors (need to come last)
cabbr W w
cabbr Q q
cabbr Wq wq
cabbr WQ wq

" custom highlighting for vim plaintext note file
augroup diary
    autocmd!
    autocmd ColorScheme,BufRead,BufNewFile *.txt
        \  syntax match DiaryDate "\v\d\d\d\d-\d\d-\d\d"
        \| highlight link DiaryDate StatusLineTerm
        \| syntax match EmailNote "\v\@email"
        \| highlight link EmailNote Todo
        \| syntax match MsgNote "\v\@msg"
        \| highlight link MsgNote EmailNote
        \| syntax match PhoneNote "\v\@call"
        \| highlight link PhoneNote ErrorMsg
augroup END

set bg=dark
