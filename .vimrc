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

" =================
" PROGRAMMING STUFF
" =================
let s:ft = ['c', 'sh', 'python', 'javascript', 'html', 'css', 'go', 'php']

" textwidth and autoindent and colorcolumn for specific filetypes
for [i, fileType] in items(s:ft)
    execute 'au FileType ' . fileType . ' setlocal tw=79 autoindent colorcolumn=81'
endfor

" special exceptions
au FileType html,css setlocal tw=0
au FileType plain,txt,markdown,tex setlocal tw=79 colorcolumn=81

" maintain sessions for certain filetypes
autocmd BufWinLeave *.tex,*.md :mkview
autocmd BufWinEnter *.tex,*.md :loadview

Plug 'tpope/vim-surround' " surrounding pair aid
Plug 'tpope/vim-sleuth'  " identify tabstop & shiftwidth
Plug 'tpope/vim-sensible'  " sensible defaults
Plug 'tpope/vim-commentary'  " commentary aid
    autocmd FileType php setlocal commentstring=//\ %s
    nnoremap <C-c> :Commentary<CR>
    vnoremap <C-c> :Commentary<CR>

" git helpers
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" fuzzy stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
    let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.75 } }
    nnoremap <leader><space> :Buffers<CR>
    nnoremap <leader>s :Ag ../<CR>
    nnoremap <leader>f :Files ../<CR>
    nnoremap <leader>g :GFiles<CR>

Plug 'mcchrish/nnn.vim'

" shows trailing spaces
Plug 'csexton/trailertrash.vim'
    let g:trailertrash_blacklist = ['markdown']

" indentation guides
Plug 'Yggdroot/indentLine'
    let g:markdown_syntax_conceal=0
    let g:vim_json_conceal=0
    let g:indentLine_bufTypeExclude = ['help', 'terminal']
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" css color code preview
Plug 'ap/vim-css-color'

" LSP via COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
    set updatetime=200 " lower updatetime
    set signcolumn=yes " always show gutter
    " automatically highlight variable occurences
        autocmd CursorHold * silent call CocActionAsync('highlight')
    " custom keymaps
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
	                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
        nmap <leader>rn <Plug>(coc-rename)
        nmap <silent> [g <Plug>(coc-diagnostic-prev)
        nmap <silent> ]g <Plug>(coc-diagnostic-next)
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
    " disable coc for filetypes not in list
        function! s:disable_coc_for_type()
        	if index(s:ft, &filetype) == -1
        	        let b:coc_enabled = 0
        	endif
        endfunction
        augroup CocGroup
        	autocmd!
        	autocmd BufNew,BufEnter * call s:disable_coc_for_type()
        augroup end

" ============
" MISC PLUGINS
" ============

" latex plugin for auto compiling
Plug 'lervag/vimtex'
    let g:vimtex_syntax_conceal_disable=1
    let g:vimtex_quickfix_mode=0
    let g:vimtex_mappings_enabled=0
    let g:vimtex_compiler_latexmk = {
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=0',
        \   '-shell-escape',
        \   '-interaction=nonstopmode',
        \ ],
        \}
    augroup vimtex_config
        au!
        au User VimtexEventQuit call vimtex#compiler#clean(0)
    augroup END

call plug#end()

" =========================
" FILETYPE SPECIFIC KEYMAPS
" =========================

au FileType c nnoremap <F5> :!make %< <CR>

" =========================

au FileType python nnoremap <buffer> <F5> :!python3 %<CR>

" =========================

au FileType markdown inoremap [ []<ESC>i
au FileType markdown inoremap ( ()<ESC>i
au FileType markdown inoremap <C-b> ****<ESC>hi
au FileType markdown inoremap <C-t> **<ESC>i
au FileType markdown nnoremap <F5> :!pandoc -V mainfont="Times New Roman" -V colorlinks=true -V linkcolor=blue --pdf-engine=xelatex -i % -o %<.pdf && open %<.pdf<CR><CR>
au FileType markdown nnoremap <C-g> :!wc %<CR>
au FileType markdown inoremap <C-c> <!-- --><ESC>bi <ESC>i

" =========================

au FileType tex inoremap <C-]> <C-x><C-]>
au FileType tex inoremap ` `'<ESC>i
au FileType tex inoremap ( ()<ESC>i
au FileType tex inoremap [ []<ESC>i
au FileType tex inoremap { {}<ESC>i
au FileType tex inoremap $ $$<ESC>i
au FileType tex inoremap <C-b> \textbf{}<ESC>i
au FileType tex inoremap <C-t> \textit{}<ESC>i
au FileType tex inoremap <C-s> \sc{}<ESC>i
au FileType tex inoremap <C-e> \begin{enumerate}<CR><CR>\end{enumerate}<ESC>ki\item 
au FileType tex nnoremap <C-g> :!texcount %<CR>
au FileType tex nnoremap <F5> :VimtexCompile<CR>
au FileType tex nnoremap <F6> :VimtexView<CR>

" ====
" MISC
" ====

" spell checker with keybinding <C-l>
function! s:spellHelper(lang)
    let $LANG = a:lang
    set spell! spelllang=$LANG
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
endfunction
command! Svspell call s:spellHelper("sv")
command! Enspell call s:spellHelper("en_us")

" highlight two spaces at the end of markdown files
au FileType markdown syntax match Error "\s\{2}$"
au FileType markdown highlight MarkdownTrailingSpaces ctermbg=248
au FileType markdown syntax match MarkdownTrailingSpaces "\s\{2}$"

" ignore common errors (need to come last)
cabbr W w
cabbr Q q
cabbr Wq wq
cabbr WQ wq
