call plug#begin()
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
set wildmode=longest,list,full

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

" clear search highlighting shortcut
nnoremap <CR> :noh<CR><CR>
" remap Q to fit current paragraph with gq
nnoremap Q movipgq`o

Plug 'tpope/vim-sensible'  " sensible defaults
Plug 'tpope/vim-fugitive'  " git good
Plug 'ap/vim-css-color' " css color code preview
Plug 'Vimjas/vim-python-pep8-indent' " correct indentation for python
Plug 'csexton/trailertrash.vim' " trailing spaces removal/highlight

" commentary aid
Plug 'tpope/vim-commentary'
    autocmd FileType php setlocal commentstring=//\ %s
    autocmd FileType c setlocal commentstring=//\ %s
    nnoremap <C-c> :Commentary<CR>
    vnoremap <C-c> :Commentary<CR>

" enable editor specific configuration (e.g. for indents)
Plug 'editorconfig/editorconfig-vim'
    set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
    set list

" trying out ctags since they're very minimal
Plug 'ludovicchabant/vim-gutentags'
    let g:gutentags_ctags_exclude = ['*.json', '*.toml', '*.log']
    let g:gutentags_cache_dir="~/.vim/gutentags"

" just for linting, no lsp now you know
Plug 'dense-analysis/ale'
    let g:ale_linters = {
      \ 'python': ['ruff'],
    \}
    let g:ale_fixers = {
      \ 'python': ['ruff', 'ruff_format'],
    \}
    let g:ale_fix_on_save = 1

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
    nnoremap <C-f> :Ag<CR>

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
        \| highlight link DiaryDate StatusLine
        \| syntax match EmailNote "\v\@email"
        \| highlight link EmailNote Keyword
        \| syntax match MsgNote "\v\@msg"
        \| highlight link MsgNote Keyword
        \| syntax match PhoneNote "\v\@call"
        \| highlight link PhoneNote Keyword
augroup END

set bg=dark
