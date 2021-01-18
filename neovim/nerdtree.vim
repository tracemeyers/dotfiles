" Close NERDTree when opening a file
let g:NERDTreeQuitOnOpen = 1
" Use netrw for :edit. NERDTree just doesn't work right when using :edit.
let g:NERDTreeHijackNetrw = 0

" If previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" | b# | endif

nnoremap <f7> :NERDTreeFocus<CR>
nnoremap <f8> :NERDTreeFind<CR>
nnoremap <f9> :NERDTreeToggle<cr>
