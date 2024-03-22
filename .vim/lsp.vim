set omnifunc=ale#completion#OmniFunc

Plug 'dense-analysis/ale'
let g:ale_completion_enabled = 1
let g_ale_linters = {
\   'python':       ['pyright', 'ruff'],
\   'go':           ['gopls'],
\   'c':            ['clangd'],
\}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'python':       ['black'],
\   'javascript':   ['prettier'],
\   'go':           ['gofmt'],
\}

nnoremap gd :ALEGoToDefinition<CR>
nnoremap gr :ALEFindReferences<CR>
nnoremap <F3> :ALEHover<CR>
nnoremap <F2> :ALERename<CR>
