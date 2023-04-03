" Init plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" True color in TMUX
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


call plug#begin()

" Basic
syntax on
set encoding=utf-8
set nocompatible
set timeoutlen=1
set splitbelow splitright
set number relativenumber
set undodir=~/.vim/undodir
set undofile
set clipboard=unnamedplus
set laststatus=2
set backspace=indent,eol,start
if has("termguicolors")
    set termguicolors
endif
set pastetoggle=<Insert>

" The bells, oh the bells!
set noerrorbells visualbell t_vb=

" Swe/eng keyboard
nnoremap Ö :
nnoremap ½ ~

" Indentation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" ctags optimization
set autochdir
set tags=tags;

" Clear search highlighting shortcut
nnoremap <CR> :noh<CR><CR>

" Buffer shortcuts
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" Ignore common errors
cabbr W w
cabbr Q q

" Colorcolumn, indentation, textwidth & keeping sessions for certain filetypes
au FileType * setlocal colorcolumn=0
au FileType c,go,java,javascript,php,make setlocal tw=79 autoindent colorcolumn=81
au FileType python,tex,markdown setlocal tw=88 autoindent colorcolumn=89
au FileType txt setlocal tw=79
autocmd BufWinLeave *.tex,*.md,*.py :mkview
autocmd BufWinEnter *.tex,*.md,*.py :loadview

Plug 'lervag/vimtex'
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

" tpope stuff, defaults, filemanager & commentary aid
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
    autocmd FileType php setlocal commentstring=//\ %s
    nnoremap <C-c> :Commentary<CR>
    vnoremap <C-c> :Commentary<CR>

" file browser
Plug 'mcchrish/nnn.vim'
    nnoremap - :NnnPicker %:p:h<CR>

" Fuzzy stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
    let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.75 } }
    nnoremap <C-s> :Ag<CR>
    nnoremap <C-f> :Files<CR>
    nnoremap <C-g> :GFiles<CR>

" Shows trailing spaces
Plug 'csexton/trailertrash.vim'
    let g:trailertrash_blacklist = ['md', 'markdown']

" Syntax checkers for Python
Plug 'psf/black', { 'branch': 'stable' }
Plug 'nvie/vim-flake8'

" Indentation guides
Plug'Yggdroot/indentLine'
    let g:markdown_syntax_conceal=0
    let g:vim_json_conceal=0
    let g:indentLine_bufTypeExclude = ['help', 'terminal']
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']

Plug 'owickstrom/vim-colors-paramount'
Plug 'igemnace/highlight.vim'
call plug#end()

" Filetype specific keymaps
" =========================
au FileType c nnoremap <F5> :!make %< <CR>
" ========================================
au FileType python nnoremap <buffer> <F5> :!python3 %<CR>
au FileType python nnoremap <F6> :Black<CR>
au FileType python nnoremap <F7> :!flake8 --format="\%(row)d: \%(text)s" %<CR>
au FileType python nnoremap <C-t> :IndentLinesToggle<CR>
" ======================================================
au FileType php nnoremap <F6> :!phpcbf --standard=PSR1 %<CR>
au FileType php nnoremap <F7> :!phpcs --standard=PSR1 %<CR>
" =========================================================
au FileType markdown inoremap [ []<ESC>i
au FileType markdown inoremap ( ()<ESC>i
au FileType markdown inoremap <C-b> ****<ESC>hi
au FileType markdown inoremap <C-t> **<ESC>i
au FileType markdown nnoremap <F5> :!pandoc -V mainfont="Times New Roman" -V colorlinks=true -V linkcolor=blue --pdf-engine=xelatex -i % -o %<.pdf && open %<.pdf<CR><CR>
au FileType markdown nnoremap <F6> :setlocal spell! spelllang=en_us<CR>
au FileType markdown nnoremap <F7> :setlocal spell! spelllang=sv<CR>
au FileType markdown inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
au FileType markdown nnoremap <C-g> :!wc %<CR>
au FileType markdown syntax match Error "\s\{2}$"
au FileType markdown highlight MarkdownTrailingSpaces ctermbg=248
au FileType markdown syntax match MarkdownTrailingSpaces "\s\{2}$"
" ============================================
au FileType tex inoremap <C-]> <C-x><C-]>
au FileType tex inoremap ` `'<ESC>i
au FileType tex inoremap ( ()<ESC>i
au FileType tex inoremap [ []<ESC>i
au FileType tex inoremap { {}<ESC>i
au FileType tex inoremap $ $$<ESC>i
au FileType tex inoremap <C-b> \textbf{}<ESC>i
au FileType tex inoremap <C-t> \textit{}<ESC>i
au FileType tex inoremap <C-s> \sc{}<ESC>i
au FileType tex inoremap <C-e> \begin{enumerate}[label=(\arabic*.)]<CR><CR>\end{enumerate}<ESC>ki\item 
au FileType tex nnoremap <C-g> :!texcount %<CR>
au FileType tex nnoremap <F5> :VimtexCompile<CR>
au FileType tex nnoremap <F6> :VimtexView<CR>
au FileType tex nnoremap <F4> :VimtexCompileOutput<CR>
au FileType tex nnoremap <F8> :setlocal spell! spelllang=en_us<CR>
au FileType tex nnoremap <F9> :setlocal spell! spelllang=sv<CR>
" =============================================================

colorscheme minimal_paramount
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfun
