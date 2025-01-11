set mouse=a

" soft wrap (to make it easier to work with other tools)
setlocal norelativenumber
setlocal nonumber
set autoindent
set linebreak
" ugly, I know, but who is looking? why are you here?
setlocal tw=99999999999999999999999999999999999999999
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
nnoremap <F5> :!pandoc -i % -o %<.pdf<CR>
nnoremap <F6> :!open %<.pdf<CR>
nnoremap <C-g> :!wc %<CR>
inoremap <C-c> <!-- --><ESC>bi <ESC>i
inoremap <C-f> []<ESC>A{.underline}<ESC>0a
" so that undo points are set to punctuation marks
inoremap ! !<C-g>u
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap : :<C-g>u
inoremap ; ;<C-g>u
inoremap ? ?<C-g>u
inoremap ( <C-g>u(
inoremap ) )<C-g>u

nnoremap <C-c> :VenterToggle<CR>
cabbr q qa
cabbr wq wqa

" don't need gutter in markdown files
set signcolumn=no

" highlight two spaces at the end of a line
syntax match Error "\s\{2}$"
highlight MarkdownTrailingSpaces ctermbg=248
syntax match MarkdownTrailingSpaces "\s\{2}$"
