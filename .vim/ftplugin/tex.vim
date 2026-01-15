inoremap <C-]> <C-x><C-]>
inoremap <C-b> \textbf{}<ESC>i
inoremap <C-t> \textit{}<ESC>i
inoremap <C-s> \sc{}<ESC>i
inoremap <C-e> \begin{enumerate}<CR><CR>\end{enumerate}<ESC>ki\item 
nnoremap <C-g> :!texcount %<CR>

nnoremap <F5> :!tectonic %<CR>
nnoremap <F6> :!open %<.pdf<CR>
nnoremap <F8> :!ctags -R bibliography.bib<CR>

filetype plugin indent off
set noautoindent
set smartindent
set nocindent
set expandtab
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
nnoremap Q :%s/\v([^\r\n])\n([^\r\n])/\1 \2/g<CR>

if exists('b:did_bibtags')
  finish
endif
let b:did_bibtags = 1

augroup BibTagsTex
  autocmd! * <buffer>
  autocmd BufWritePost <buffer> call s:update_bib_tags()
augroup END

function! s:update_bib_tags() abort
  let l:files = globpath(expand('%:p:h'), '*.bib', 0, 1)
  if !empty(l:files)
    silent! execute '!ctags -R ' . join(l:files) . ' &'
  endif
endfunction
