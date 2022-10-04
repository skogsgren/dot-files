" Auto-pairs
inoremap ` `'<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap $ $$<ESC>i

" Misc
inoremap <C-b> \textbf{}<ESC>i
inoremap <C-t> \textit{}<ESC>i
inoremap <C-s> \textsc{}<ESC>i
inoremap <C-v> \underline{}<ESC>i
inoremap <C-e> \begin{enumerate}[label=(\arabic*.)]<CR><CR>\end{enumerate}<ESC>ki\item 
inoremap <C-f> \begin{frame}<CR>\end{frame}<ESC>k$a{}<ESC>i
nnoremap <C-l> :VimtexCompile<CR>
nnoremap <C-k> :VimtexView<CR>
nnoremap <C-j> :VimtexCompileOutput<CR>
