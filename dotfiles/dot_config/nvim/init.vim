" Neovim needs a POSIX-compliant shell to work
if &shell =~# 'fish$'
    set shell=bash
endif

" ━━━━━━━━━━━━━━━━━━━━ PLUGINS ━━━━━━━━━━━━━━━━━━━━
call plug#begin()
Plug 'sbdchd/neoformat'							" Autoformatter
Plug 'tpope/vim-commentary' 					" Easily comment/uncomment lines
Plug 'preservim/nerdtree'						" File explorer
Plug 'ervandew/supertab' 						" Simple autocomplete
Plug 'windwp/nvim-autopairs' 					" Autobrackets
Plug 'catppuccin/nvim', {'as': 'catppuccin'}	" Catppuccin colorscheme
Plug 'khaveesh/vim-fish-syntax' 				" Fish syntax etc.
Plug 'elkowar/yuck.vim' 						" Yuck syntax
call plug#end()

" ━━━━━━━━━━━━━━━━━━━━ EYE CANDY ━━━━━━━━━━━━━━━━━━━━
" Catppuccin theme
let g:catppuccin_flavour = "mocha"
colorscheme catppuccin

" Tabs
set tabstop=4
set shiftwidth=0

" ━━━━━━━━━━━━━━━━━━━━ FORMATTING ━━━━━━━━━━━━━━━━━━━━
" Run autoformatter before writing
au BufWrite * :Neoformat
" Autocomplete brackets
lua << EOF
require("nvim-autopairs").setup {}
EOF
