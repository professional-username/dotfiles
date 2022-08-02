" Plugins
call plug#begin()
Plug 'sbdchd/neoformat'							" Autoformatter
Plug 'tpope/vim-commentary' 					" Easily comment/uncomment lines
Plug 'preservim/nerdtree'						" File explorer
Plug 'ervandew/supertab' 						" Simple autocomplete
Plug 'catppuccin/nvim', {'as': 'catppuccin'}	" Catppuccin colorscheme
call plug#end()

let g:catppuccin_flavour = "mocha"
colorscheme catppuccin

set tabstop=4
set shiftwidth=0

" Run autoformatter before writing
au BufWrite * :Neoformat
