set mouse=a
" text width
setlocal tw=79
setlocal norelativenumber
setlocal nonumber
set autoindent

" keymappings
nnoremap G Gzz
inoremap [ []<ESC>i
inoremap ( ()<ESC>i
inoremap <C-b> ****<ESC>hi
inoremap <C-t> **<ESC>i
nnoremap <F5> :!pandoc --pdf-engine=xelatex -i % -o %<.pdf<CR>
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
