filetype plugin on

set nocompatible            " Disable compatibility to old-time vi
set hidden                  " allow files to not be saved when switching buffers
set showmatch               " Show matching brackets.
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " tab indentation level
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed

set history=1000
set scrollback=100000

" Make W do the same thing as w
cnoreabbrev W w

" ------------------------------------------------------------ backups, etc

" Move various vim autocreated files so they don't polute workspace
set backup
set backupdir=~/.local/share/nvim/backups,.
set directory=~/.local/share/nvim/swaps,.
set undofile
set undodir=~/.local/share/nvim/undo,.
autocmd BufWritePre * let &backupext = substitute(expand('%:p:h'), '/', '%', 'g')


" ------------------------------------------------------------ ui

colorscheme PaperColor

set colorcolumn=80
set background=light

set cursorline
hi CursorLine cterm=bold ctermbg=lightgreen guibg=lightgreen
" Make it readable when using light color theme
hi CocInfoSign  ctermfg=black guifg=#fab005

set relativenumber
set wildmode=list:longest,full

" Check for file specific VIM settings
set modeline
" Visual mode: display selected chars/lines
set showcmd

" Always show this many lines at top/bottom of screen
set scrolloff=4

" Always display the status line (file, line number, etc)
set laststatus=2

" Always draw the signcolumn.
" TM: DISABLED to see if I actually use this anymore
" set signcolumn=yes

" Match and highlight trailing whitespaces at end of line
highlight BadWhitespace ctermbg=red
autocmd BufWinEnter * match BadWhitespace /\s\+$/
autocmd InsertEnter * match BadWhitespace /\s\+$/
autocmd InsertLeave * match BadWhitespace /\s\+$/

" wrap long lines in quickfix
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END


" ------------------------------------------------------------ maps

" Allow visual mode selection to be searched
vmap * y/<C-R>"<CR>
