Plug 'lervag/vimtex'
    let g:vimtex_syntax_conceal_disable=1
    let g:vimtex_quickfix_mode=0
    let g:vimtex_mappings_enabled=0
    let g:vimtex_compiler_latexmk = {
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=0',
        \   '-shell-escape',
        \   '-interaction=nonstopmode',
        \ ],
        \}
    augroup vimtex_config
        au!
        au User VimtexEventQuit call vimtex#compiler#clean(0)
    augroup END

au FileType tex inoremap <C-]> <C-x><C-]>
au FileType tex inoremap ` `'<ESC>i
au FileType tex inoremap ( ()<ESC>i
au FileType tex inoremap [ []<ESC>i
au FileType tex inoremap { {}<ESC>i
au FileType tex inoremap $ $$<ESC>i
au FileType tex inoremap <C-b> \textbf{}<ESC>i
au FileType tex inoremap <C-t> \textit{}<ESC>i
au FileType tex inoremap <C-s> \sc{}<ESC>i
au FileType tex inoremap <C-e> \begin{enumerate}<CR><CR>\end{enumerate}<ESC>ki\item 
au FileType tex nnoremap <C-g> :!texcount %<CR>
au FileType tex nnoremap <F5> :VimtexCompile<CR>
au FileType tex nnoremap <F6> :VimtexView<CR>

setlocal tw=79
setlocal colorcolumn=81
