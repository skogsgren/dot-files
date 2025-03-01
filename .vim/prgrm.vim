Plug 'tpope/vim-sensible'  " sensible defaults
Plug 'airblade/vim-gitgutter' " show git changes
Plug 'ap/vim-css-color' " css color code preview
Plug 'LunarWatcher/auto-pairs' "auto pair parentheses etc
Plug 'Vimjas/vim-python-pep8-indent' " correct indentation for python

" enable editor specific configuration (e.g. for indents)
Plug 'editorconfig/editorconfig-vim'
    set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
    hi SpecialKey guifg=#303030
    set list



" fuzzy stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
    let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.75 } }
    nnoremap <leader><space> :Buffers<CR>
    nnoremap <leader>s :Ag<CR>
    nnoremap <leader>f :Files<CR>
    nnoremap <leader>g :GFiles?<CR>
