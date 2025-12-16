inoremap <S-CR> <Space><Space><CR>

" soft wrap (to make it easier to work with other tools, and git)
setlocal norelativenumber
setlocal nonumber
set autoindent
set linebreak
setlocal textwidth=0
setlocal wrap
setlocal linebreak
nnoremap j gj
vnoremap j gj
onoremap j gj
nnoremap k gk
vnoremap k gk
onoremap k gk
nnoremap 0 g0
nnoremap $ g$

" keymappings
nnoremap G Gzz
inoremap [ []<ESC>i
inoremap ( ()<ESC>i
inoremap <C-b> ****<ESC>hi
inoremap <C-t> **<ESC>i
nnoremap <C-g> :!wc %<CR>
inoremap <C-c> <!-- --><ESC>bi <ESC>i

" so that undo points are set to punctuation marks
inoremap ! !<C-g>u
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap : :<C-g>u
inoremap ; ;<C-g>u
inoremap ? ?<C-g>u
inoremap ( <C-g>u(
inoremap ) )<C-g>u

nnoremap Q :%s/\v([^\r\n])\n([^\r\n])/\1 \2/g<CR>
cabbr q qa
cabbr wq wqa

" don't need gutter in markdown files
set signcolumn=no

Enspell
