inoremap <C-]> <C-x><C-]>
inoremap ` `'<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap $ $$<ESC>i
inoremap <C-b> \textbf{}<ESC>i
inoremap <C-t> \textit{}<ESC>i
inoremap <C-s> \sc{}<ESC>i
inoremap <C-e> \begin{enumerate}<CR><CR>\end{enumerate}<ESC>ki\item 
nnoremap <C-g> :!texcount %<CR>

nnoremap <F5> :!latexmk %<CR>
nnoremap <F6> :!open %<.pdf<CR>
nnoremap <F6> :!latexmk -c<CR>

setlocal tw=79
setlocal colorcolumn=81
setlocal norelativenumber nonumber signcolumn=no
