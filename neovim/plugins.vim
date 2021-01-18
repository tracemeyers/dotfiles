call plug#begin('~/.local/share/nvim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'sheerun/vim-polyglot'
Plug 'jlanzarotta/bufexplorer'
Plug 'preservim/nerdtree'
Plug 'rhysd/git-messenger.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/echodoc.vim'
Plug 'APZelos/blamer.nvim'

call plug#end()
