" Use the gopls daemon
let g:go_gopls_options = ['-remote=auto']

" Turn off these features which are handled by coc-go
let g:go_code_completion_enabled = 0
let g:go_fmt_autosave = 0

" Show test name
let g:go_test_show_name=1

" This sucks too much to keep it enabled. Works fine in vim, bad in nvim.
" GoTest* won't open a quickfix window with errors unless I do this. Annoying,
" but better than not being able to see the errors.
let g:go_term_enabled = 1
let g:go_term_mode = "split"
let g:go_term_height = 8
let g:go_term_close_on_exit = 1
let g:go_term_reuse = 0

