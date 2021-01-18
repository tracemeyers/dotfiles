call plug#begin('~/.local/share/nvim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'jlanzarotta/bufexplorer'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'rhysd/git-messenger.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/echodoc.vim'
Plug 'APZelos/blamer.nvim'

call plug#end()
