" Neovim needs a POSIX-compliant shell to work
if &shell =~# 'fish$'
    set shell=bash
endif

" ━━━━━━━━━━━━━━━━━━━━ PLUGINS ━━━━━━━━━━━━━━━━━━━━
call plug#begin()
Plug 'sbdchd/neoformat'								" Autoformatter
Plug 'tpope/vim-commentary'							" Easily comment/uncomment lines
Plug 'ervandew/supertab'							" Simple autocomplete
Plug 'windwp/nvim-autopairs'						" Autobrackets
Plug 'catppuccin/nvim', {'as': 'catppuccin'}		" Catppuccin colorscheme
Plug 'khaveesh/vim-fish-syntax'						" Fish syntax etc.
Plug 'elkowar/yuck.vim' 							" Yuck syntax
Plug 'nvim-telescope/telescope-file-browser.nvim' 	" File explorer
Plug 'nvim-telescope/telescope.nvim' 				" Fuzzy file finder
Plug 'nvim-lua/plenary.nvim' 						" Lua functions
call plug#end()

" ━━━━━━━━━━━━━━━━━━━━ FILES ━━━━━━━━━━━━━━━━━━━━
lua << EOF
require("telescope").setup {}
require("telescope").load_extension "file_browser"
vim.api.nvim_set_keymap(
  "n",
  "<leader><leader>",
  ":Telescope file_browser <Enter>",
  { noremap = true }
)
EOF

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
