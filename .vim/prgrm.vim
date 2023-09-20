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

