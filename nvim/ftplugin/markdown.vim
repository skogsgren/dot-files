set textwidth=80

" Auto-pairs
inoremap [ []<ESC>i
inoremap ( ()<ESC>i

inoremap <C-b> ****<ESC>hi
inoremap <C-t> **<ESC>i
nnoremap <C-j> :setlocal spell! spelllang=en_us<CR>
nnoremap <C-k> :setlocal spell! spelllang=sv<CR>
nnoremap <F6> :!pandoc -i % -o %<.pdf --pdf-engine=xelatex && open %<.pdf<CR>
