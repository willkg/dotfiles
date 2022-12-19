" Initialize vim-plug
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

let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('rw', 1000)
let g:neomake_open_list = 2

" let g:vim_diary_basedir = '~/journal2/'

" disable quote concealing in json
let g:vim_json_syntax_conceal = 0
" set conceallevel=0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" colorscheme
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard
set background=dark

" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif

" vimwiki settings
let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_toc': 1, 'auto_diary_index': 1, 'auto_tags': 1}]
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'path_html': '~/public_html/', 'ext': '.md', 'syntax': 'markdown', 'auto_toc': 1, 'auto_diary_index': 1, 'auto_tags': 1}]
" nix one-character markers so they show up
let g:vimwiki_conceallevel = 0
let g:vimwiki_conceal_onechar_markers = 0
" stop truncating urls which drives me crazy
let g:vimwiki_url_maxsave = 0

" Shut off code folding
set nofoldenable

" Use 4 spaces--no tabs
set tabstop=4 shiftwidth=4 expandtab

" Use "set number!" to toggle
set number
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw

filetype plugin on
syntax on

" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase

" Show next 3 lines while scrolling.
if !&scrolloff
    set scrolloff=3
endif

" Set leader key to SPACE
let mapleader="\<SPACE>"

" SPACE-b switch to buffer
nnoremap <Leader>b :buffer<SPACE>

" Disable mouse in nvim
set mouse=
