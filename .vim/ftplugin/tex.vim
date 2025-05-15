inoremap <C-]> <C-x><C-]>
" inoremap ` `'<ESC>i
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap { {}<ESC>i
" inoremap $ $$<ESC>i
inoremap <C-b> \textbf{}<ESC>i
inoremap <C-t> \textit{}<ESC>i
inoremap <C-s> \sc{}<ESC>i
inoremap <C-e> \begin{enumerate}<CR><CR>\end{enumerate}<ESC>ki\item 
nnoremap <C-g> :!texcount %<CR>

nnoremap <F5> :!latexmk -shell-escape -xelatex %<CR>
nnoremap <F6> :!open %<.pdf<CR>
nnoremap <F7> :!latexmk -c<CR>
nnoremap <F8> :!ctags -R bibliography.bib<CR>

filetype plugin indent off
set noautoindent
set smartindent
set nocindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

setlocal signcolumn=no
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

autocmd VimLeave *.tex :!latexmk -c *.tex
