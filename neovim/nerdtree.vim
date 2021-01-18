" Close NERDTree when opening a file
let g:NERDTreeQuitOnOpen = 1

" If previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" | b# | endif

nnoremap <f7> :NERDTreeFocus<CR>
nnoremap <f8> :NERDTreeFind<CR>
nnoremap <f9> :NERDTreeToggle<cr>
