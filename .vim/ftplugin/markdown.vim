" keymappings
inoremap [ []<ESC>i
inoremap ( ()<ESC>i
inoremap <C-b> ****<ESC>hi
inoremap <C-t> **<ESC>i
nnoremap <F5> :!pandoc -V mainfont="Times New Roman" -V colorlinks=true -V linkcolor=blue --pdf-engine=xelatex -i % -o %<.pdf && open %<.pdf<CR><CR>
nnoremap <C-g> :!wc %<CR>
inoremap <C-c> <!-- --><ESC>bi <ESC>i

" highlight two spaces at the end of a line
syntax match Error "\s\{2}$"
highlight MarkdownTrailingSpaces ctermbg=248
syntax match MarkdownTrailingSpaces "\s\{2}$"
