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

" Clear search highlighting shortcut
nnoremap <CR> :noh<CR><CR>

" Buffer shortcuts
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" Remember sessions
augroup remember_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
augroup END

" Colorcolumn, indentation & textwidth for certain filetypes
au FileType * setlocal colorcolumn=0
au FileType c,go,java,javascript,php,make,python,markdown,tex setlocal tw=79 autoindent colorcolumn=81

" Make W case insensitive
cabbr W w

" Since I never use Q remap it to reformat line
nnoremap Q gqq

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

Plug 'tpope/vim-commentary'
    nnoremap <C-c> :Commentary<CR>
    vnoremap <C-c> :Commentary<CR>

Plug 'csexton/trailertrash.vim'
    let g:trailertrash_blacklist = ['md', 'markdown']

Plug 'tpope/vim-surround'

call plug#end()

colorscheme jcs

au FileType c nnoremap <F5> :!make %< <CR>

au FileType python nnoremap <buffer> <F5> :!python3 %<CR>
au FileType python nnoremap <F7> :!flake8 %<CR>

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
