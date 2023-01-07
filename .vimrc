" Init plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Basic
Plug 'tpope/vim-sensible'
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
au FileType c,go,java,javascript,php,make,markdown,tex setlocal tw=79 autoindent colorcolumn=81
au FileType python setlocal tw=88 autoindent colorcolumn=81,89
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

Plug 'tpope/vim-vinegar'

Plug 'tpope/vim-commentary'
    nnoremap <C-c> :Commentary<CR>
    vnoremap <C-c> :Commentary<CR>

" Shows trailing spaces
Plug 'csexton/trailertrash.vim'
    let g:trailertrash_blacklist = ['md', 'markdown']

" Indentation guides
Plug'Yggdroot/indentLine'
    let g:indentLine_filetype=['py', 'c']
    let g:markdown_syntax_conceal=0
    let g:vim_json_conceal=0
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Syntax checkers for Python
Plug 'psf/black', { 'branch': 'stable' }
Plug 'nvie/vim-flake8'

call plug#end()

colorscheme jcs

" Filetype specific keymaps

au FileType c nnoremap <F5> :!make %< <CR>

au FileType python nnoremap <buffer> <F5> :!python3 %<CR>
au FileType python nnoremap <F6> :Black<CR>
au FileType python nnoremap <F7> :!flake8 --format="\%(row)d: \%(text)s" %<CR>
au FileType python nnoremap <C-t> :IndentLinesToggle<CR>

au FileType markdown inoremap [ []<ESC>i
au FileType markdown inoremap ( ()<ESC>i
au FileType markdown inoremap <C-b> ****<ESC>hi
au FileType markdown inoremap <C-t> **<ESC>i
au FileType markdown nnoremap <F5> :!pandoc -i % -o %<.pdf --pdf-engine=xelatex && open %<.pdf<CR>
au FileType markdown nnoremap <F6> :setlocal spell! spelllang=en_us<CR>
au FileType markdown nnoremap <F7> :setlocal spell! spelllang=sv<CR>
au FileType markdown inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
au FileType markdown syntax match Error "\s\{2}$"
au FileType markdown highlight MarkdownTrailingSpaces ctermbg=248
au FileType markdown syntax match MarkdownTrailingSpaces "\s\{2}$"
au FileType markdown nnoremap <C-g> :!wc %<CR>

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
