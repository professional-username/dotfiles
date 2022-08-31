" vim:foldmethod=marker
" Neovim needs a POSIX-compliant shell to work
if &shell =~# 'fish$'
    set shell=bash
endif

" ━━━━━━━━━━━━━━━━━━━━ PLUGINS ━━━━━━━━━━━━━━━━━━━━ {{{
call plug#begin()
Plug 'sbdchd/neoformat'								" Autoformatter
Plug 'tpope/vim-commentary'							" Easily comment/uncomment lines
Plug 'windwp/nvim-autopairs'						" Autobrackets
Plug 'catppuccin/nvim', {'as': 'catppuccin'}		" Catppuccin colorscheme
Plug 'khaveesh/vim-fish-syntax'						" Fish syntax etc.
Plug 'elkowar/yuck.vim' 							" Yuck syntax
Plug 'nvim-telescope/telescope-file-browser.nvim' 	" File explorer
Plug 'nvim-telescope/telescope.nvim' 				" Fuzzy file finder
Plug 'nvim-lua/plenary.nvim' 						" Lua functions
Plug 'neoclide/coc.nvim', {'branch': 'release'} 	" Autocomplete
call plug#end()
" }}}

" ━━━━━━━━━━━━━━━━━━━━ UTILITY ━━━━━━━━━━━━━━━━━━━━ {{{
lua << EOF
-- Setup file browsing
require("telescope").setup {}
require("telescope").load_extension "file_browser"
vim.api.nvim_set_keymap(
  "n",
  "<leader><leader>",
  ":Telescope file_browser <Enter>",
  { noremap = true }
)
EOF
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
" }}}

" ━━━━━━━━━━━━━━━━━━━━ AUTOCOMPLETE ━━━━━━━━━━━━━━━━━━━━ {{{
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <S-CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endifsilent 
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" }}}

" ━━━━━━━━━━━━━━━━━━━━ EYE CANDY ━━━━━━━━━━━━━━━━━━━━ {{{
" Catppuccin theme
lua << EOF
require("catppuccin").setup({integrations = {coc_nvim=true, telescope=true}})
EOF
let g:catppuccin_flavour = "mocha"
colorscheme catppuccin
" Tabs
set tabstop=4
set shiftwidth=0
" }}}

" ━━━━━━━━━━━━━━━━━━━━ FORMATTING ━━━━━━━━━━━━━━━━━━━━ {{{
" Run autoformatter before writing
au BufWrite * :Neoformat
" Autocomplete brackets
lua << EOF
require("nvim-autopairs").setup {}
EOF
" }}}
