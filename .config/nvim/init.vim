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
:set clipboard=unnamedplus

" ################# 
" #### PLUGİNS ####
" ################# 
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/lukas-reineke/indent-blankline.nvim' "Kenar çizgisi.
Plug 'https://github.com/mattn/emmet-vim' "html completion.
Plug 'https://github.com/sbdchd/neoformat' "Clang-format benzeri otomatik düzenleyici.
" Plug 'https://github.com/Zeioth/compiler.nvim'
Plug 'https://github.com/michaelb/sniprun'
" Plug 'https://github.com/mfussenegger/nvim-dap' "debuging
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/akinsho/bufferline.nvim'
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gsc
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
" Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
" Plug 'https://github.com/cdelledonne/vim-cmake'
" Plug 'https://github.com/clangd/coc-clangd'
Plug 'https://github.com/mhinz/vim-startify' " nvim start screen
Plug 'https://github.com/alvan/vim-closetag' " close tag
" cmp autocomlete configuration.
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'https://github.com/hrsh7th/vim-vsnip' " Snippets plugin.
set encoding=UTF-8

call plug#end()
" ###############################
" ######## cmp Settings #########
" ###############################
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

	-- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
	-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['html'].setup {
	capabilities = capabilities
  }
  require('lspconfig')['bashls'].setup {
	capabilities = capabilities
  }
  require('lspconfig')['gopls'].setup {
	capabilities = capabilities
  }
  require('lspconfig')['gopls'].setup {
	capabilities = capabilities
  }
  require('lspconfig')['sqls'].setup {
	capabilities = capabilities
  }
  require('lspconfig')['phpactor'].setup {
	capabilities = capabilities
  }
EOF

" ############################
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
" let g:coc_global_extensions = ['coc-clangd']
" C/C++ dosyalarında coc-clangd'yi başlatmak için
" autocmd FileType c,cpp coc-start
" Eklenti ayarlarını yapın
" let g:coc_clangd_executable = 'clangd'
" let g:coc_clangd_args = ['-j', '4']  " İsteğe bağlı: clangd'ye iletilen ek argümanlar

" coc.nvim yapılandırması
" let g:coc_global_extensions = [
  " \ 'coc-sql',
  " \ 'coc-snippets',
  " \ ]

" bufferline settings
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

