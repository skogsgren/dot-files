setlocal cc=90
setlocal tw=0

nnoremap <F5> :!python3 %<CR>
function! PydocQuery()
    let query = input("pydoc query: ")
    if !empty(query)
        execute "!pydoc3 " . query
    else
        echom "invalid query"
    endif
endfunction
nnoremap <F6> :call PydocQuery()<CR>
