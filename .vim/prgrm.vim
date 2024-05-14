Plug 'tpope/vim-sensible'  " sensible defaults
Plug 'airblade/vim-gitgutter' " show git changes
Plug 'ap/vim-css-color' " css color code preview
Plug 'madox2/vim-ai' "openai code assistant
Plug 'LunarWatcher/auto-pairs' "auto pair parentheses etc

" show trailing spaces
Plug 'csexton/trailertrash.vim'
    let g:trailertrash_blacklist = ['markdown', 'md']

" fuzzy stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
    let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.75 } }
    nnoremap <leader><space> :Buffers<CR>
    nnoremap <leader>s :Ag<CR>
    nnoremap <leader>f :Files<CR>
    nnoremap <leader>g :GFiles<CR>
