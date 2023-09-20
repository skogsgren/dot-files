Plug 'neoclide/coc.nvim', {'branch': 'release'}
    set updatetime=200 " lower updatetime
    set signcolumn=yes " always show gutter
    " automatically highlight variable occurences
        autocmd CursorHold * silent call CocActionAsync('highlight')
    " custom keymaps
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
	                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
        nmap <leader>rn <Plug>(coc-rename)
        nmap <silent> [g <Plug>(coc-diagnostic-prev)
        nmap <silent> ]g <Plug>(coc-diagnostic-next)
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
    " disable coc for filetypes not in list
        function! s:disable_coc_for_type()
        	if index(s:ft, &filetype) == -1
        	        let b:coc_enabled = 0
        	endif
        endfunction
        augroup CocGroup
        	autocmd!
        	autocmd BufNew,BufEnter * call s:disable_coc_for_type()
        augroup end
