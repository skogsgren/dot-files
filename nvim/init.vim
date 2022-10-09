" Init plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Basic
set timeoutlen=1
set nocompatible
set splitbelow splitright
set number relativenumber
set undodir=~/.config/nvim/undodir
set undofile
set clipboard=unnamedplus

" Indentation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Clear search highlighting
nnoremap <CR> :noh<CR><CR>

" Buffer shortcuts
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" Split shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Remember sessions
augroup remember_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
augroup END

" Default to no color column
au FileType * setlocal colorcolumn=0

" Source code gets wrapped at <80 and auto-indented
au FileType arduino,asm,c,cpp,go,java,javascript,php,html,make,objc,perl,python setlocal tw=79 autoindent colorcolumn=81

" Spell check
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Make W, Q case insensitive
cabbr W w
cabbr Q q

" LaTeX
Plug 'lervag/vimtex', { 'for': 'tex' }
    let g:vimtex_syntax_conceal_disable=1
    let g:vimtex_quickfix_mode=0
    let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=0',
        \   '-interaction=nonstopmode',
        \ ],
        \}
    augroup vimtex_config
        au!
        au User VimtexEventQuit call vimtex#compiler#clean(0)
    augroup END

Plug 'junegunn/goyo.vim'
    nnoremap <C-g> :Goyo 70%<bar> highlight StatusLineNC ctermfg=white <CR>
    function! s:goyo_enter()
      let b:quitting = 0
      let b:quitting_bang = 0
      autocmd QuitPre <buffer> let b:quitting = 1
      cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
    endfunction
    function! s:goyo_leave()
      " Quit Vim if this is the only remaining buffer 
      if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
          qa!
        else
          qa
        endif
      endif
    endfunction

autocmd User GoyoEnter call <SID>goyo_enter()
autocmd User GoyoLeave call <SID>goyo_leave()

Plug 'tpope/vim-commentary'
    nnoremap <C-c> :Commentary<CR>
    vnoremap <C-c> :Commentary<CR>
Plug 'nvie/vim-flake8'
Plug 'csexton/trailertrash.vim'
Plug 'tpope/vim-vinegar'
    nnoremap <C-t> :Lexplore<CR>
    let g:netrw_winsize = 28
    let g:netrw_keepdir = 0

call plug#end()

colorscheme eink
