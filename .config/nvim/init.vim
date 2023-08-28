" ######################### 
" #### NEOVİM SETTINGS ####
" ######################### 
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=3
:set mouse=a
:set completeopt=preview " For No Previews
:set syntax=sql

" ################# 
" #### PLUGİNS ####
" ################# 
call plug#begin()

Plug 'https://github.com/lukas-reineke/indent-blankline.nvim' "Kenar çizgisi.
Plug 'https://github.com/mattn/emmet-vim' "html completion.
Plug 'https://github.com/sbdchd/neoformat' "Clang-format benzeri otomatik düzenleyici.
" Plug 'https://github.com/Zeioth/compiler.nvim'
Plug 'https://github.com/michaelb/sniprun'
Plug 'https://github.com/mfussenegger/nvim-dap' "debuging
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/akinsho/bufferline.nvim'
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gsc
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
Plug 'https://github.com/cdelledonne/vim-cmake'
Plug 'https://github.com/clangd/coc-clangd'
Plug 'https://github.com/mhinz/vim-startify' " nvim start screen
Plug 'https://github.com/alvan/vim-closetag' " close tag

set encoding=UTF-8

call plug#end()

"############################
" #### KEYBOARD SHORTCUTS ####
" ############################ 
inoremap <expr> <C-n> pumvisible() ? "\<C-y>" : "\<C-n>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

nmap <F8> :TagbarToggle<CR>
nnoremap <C-h> <cmd>Telescope find_files<CR>
nnoremap <C-u> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
"
" ######################### 
" #### PLUGİN SETTINGS #### 
" ######################### 
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Coc-clangd eklentisini etkinleştir
let g:coc_global_extensions = ['coc-clangd']
" C/C++ dosyalarında coc-clangd'yi başlatmak için
autocmd FileType c,cpp coc-start
" Eklenti ayarlarını yapın
let g:coc_clangd_executable = 'clangd'
let g:coc_clangd_args = ['-j', '4']  " İsteğe bağlı: clangd'ye iletilen ek argümanlar

" coc.nvim yapılandırması
" let g:coc_global_extensions = [
  " \ 'coc-sql',
  " \ 'coc-snippets',
  " \ ]

" In your init.lua or init.vim
" set termguicolors=0
lua << EOF
require("bufferline").setup{}
EOF

" Neoformat için w ya basınca otomatik düzeltme ayarı.
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" colorscheme nightfox
