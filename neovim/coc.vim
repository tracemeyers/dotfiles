function SetCOCShortcuts()
    nmap <silent> <leader>lca <Plug>(coc-codeaction)
    nmap <silent> <leader>ld <Plug>(coc-definition)
    nmap <silent> <leader>lf <Plug>(coc-fix-current)
    nmap <silent> <leader>lh :call CocAction("doHover")<CR>
    nmap <silent> <leader><leader>f <Plug>(coc-format)
    vmap <silent> <leader><leader>f <Plug>(coc-format-selected)
    nmap <silent> <leader>li <Plug>(coc-implementation)
    nmap <silent> <leader><leader>l <Plug>(coc-codelens-action)
    nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)
    nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
    nmap <silent> <leader>lr <Plug>(coc-references)
    nmap <silent> <leader><leader>r <Plug>(coc-rename)
    nmap <silent> <leader>lt <Plug>(coc-type-definition)
    nmap <silent> <leader><leader>o :CocList outline<cr>
    nmap <silent> <leader><leader>s :CocList -I symbols<cr>

    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> <leader>t :CocCommand go.test.toggle<cr>

    inoremap <silent><expr> <c-space> coc#refresh()
    nnoremap <c-c> :CocCommand

endfunction()

augroup COC
  autocmd!
  autocmd FileType go call SetCOCShortcuts()
  autocmd FileType javascript call SetCOCShortcuts()
augroup END


" ------------------------------------------------------------ coc-go

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')