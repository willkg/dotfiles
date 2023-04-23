-- FIXME plugins
vim.cmd([[
call plug#begin('~/.local/share/nvim/plugged')
  " sensible start for configuration
  Plug 'tpope/vim-sensible'

  " status bar, themes, and ui
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Yggdroot/indentLine'

  " dev tools
  Plug 'neomake/neomake'
  Plug 'Chiel92/vim-autoformat'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'vimwiki/vimwiki'

  " opening files
  " nerdtree for file view
  " Plug 'scrooloose/nerdtree'
  " Plug 'kien/ctrlp.vim'
  Plug 'tpope/vim-vinegar'

  " my plugin
  " Plug '~/projects/vim-diary-utils/'
call plug#end()
]])

vim.cmd([[
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore', 'E203,E501,W503']
    \ }
call neomake#configure#automake('rw', 1000)
]])
vim.g.neomake_open_list = 2

-- disable quote concealing in json
vim.g.vim_json_syntax_conceal = 0
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0

-- colorscheme
vim.cmd([[
let base16colorspace = 256
colorscheme base16-gruvbox-dark-hard
set background=dark
if has("termguicolors")
  set termguicolors
endif
]])

-- vimwiki settings
vim.cmd([[
let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_toc': 1, 'auto_diary_index': 1, 'auto_tags': 1}]
]])
-- let g:vimwiki_list = [{"path": "~/vimwiki/", "path_html": "~/public_html/", "ext": ".md", "syntax": "markdown", "auto_toc": 1, "auto_diary_index": 1, "auto_tags": 1}]
-- nix one-character markers so they show up
vim.g.vimwiki_conceallevel = 0
vim.g.vimwiki_conceal_onechar_markers = 0
-- stop truncating urls which drives me crazy
vim.g.vimwiki_url_maxsave = 0

-- Shut off code folding
vim.opt.foldenable = false

-- Use 4 spaces--no tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Use "set number!" to toggle
vim.opt.number = true
vim.opt.hidden = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.showmatch = false
vim.opt.lazyredraw = false

vim.cmd([[
filetype plugin on
syntax on
]])

-- Search configuration
vim.opt.ignorecase = true  -- ignore case when searching
vim.opt.smartcase = true   -- turn on smartcase

-- Show next 3 lines while scrolling.
vim.cmd([[
if !&scrolloff
    set scrolloff=3
endif
]])

-- Set leader key to SPACE
vim.cmd([[
let mapleader="\<SPACE>"
]])

-- SPACE-b switch to buffer
vim.cmd([[
nnoremap <Leader>b :buffer<SPACE>
]])

-- Disable mouse in nvim
vim.opt.mouse = ""
