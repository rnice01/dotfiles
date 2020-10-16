set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'

" Editor plugins
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" File tree and search
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim'

" intellisense
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" autocompletion
"Plugin 'shougo/deoplete.nvim'
"Plugin 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'}
"Plugin 'kristijanhusak/deoplete-phpactor'
"Plugin 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"Plugin 'ervandew/supertab'
"Plugin 'StanAngeloff/php.vim'
"Plugin 'Quramy/tsuquyomi'

" Linting
"Plugin 'vim-syntastic/syntastic'

" Syntax
"Plugin 'leafgarland/typescript-vim'

" UI
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-startify'

" Colorschemes
Plugin 'joshdick/onedark.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'morhetz/gruvbox'
Plugin 'ayu-theme/ayu-vim'
Plugin 'sainnhe/gruvbox-material'
Plugin 'rakr/vim-one'
Plugin 'drewtempelmeyer/palenight.vim'

call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""
" CoC
""""""""""""""""""""""""""""""""""
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers hae issues with backup files, see
" https://github.com/neoclide/coc.vim issue #649
set nobackup
set nowritebackup

" Display for messages
set cmdheight=2

" Override diagnostic message default of 4000
set updatetime=300

set shortmess+=c

set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

""""""""""""""""""""""""""""""""""
" CoC Snippets
""""""""""""""""""""""""""""""""""

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

""""""""""""""""""""""""""""""""""
" Startup
""""""""""""""""""""""""""""""""""
 autocmd VimEnter *
                 \   if !argc()
                 \ |   Startify
                 \ |   NERDTree
                 \ |   wincmd w
                 \ | endif


""""""""""""""""""""""""""""""""""
" Nerdtree
""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = 'right'
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35

""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""
nnoremap <C-p> :Files<Cr>
nnoremap <C-t> :Rg<Cr>


""""""""""""""""""""""""""""""""""""
" GUI
""""""""""""""""""""""""""""""""""""
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
syntax on
set background=dark
colorscheme palenight
"let ayucolor="mirage"
"colorscheme ayu
let g:gruvbox_contrast_dark='dark'
let g:gruvbox_material_background='dark'

set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline_theme='one'
set guifont="SauceCodePro Nerd Font Mono:h11"


""""""""""""""""""""""""""""""""""""
" Keymaps
""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast quit
nmap <leader>q :q<cr>

" Fast repeat last command
nmap <leader>2 :@:<cr>

map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" Map space + number 1-9 to change window buffer
let i = 1
while i <= 9
  execute 'nnoremap <Space>' . i . ' :' . i . 'wincmd w<CR>'
  execute 'nnoremap <Leader>' . i . ' ' . i . 'gt'
  let i = i + 1
endwhile

""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start
set ruler
set number
set visualbell
set ignorecase
let loaded_netrwPlugin = 1

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Undo
set undofile
set undolevels=5000
set undodir=~/.vim/undo

""""""""""""""""""""""""""""""""""
" File Type Indentations
""""""""""""""""""""""""""""""""""
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal expandtab ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal expandtab ts=2 sts=2 sw=2
autocmd Filetype php setlocal expandtab ts=4 sts=4 sw=4
autocmd Filetype elixir setlocal expandtab ts=2 sts=2 sw=2

autocmd Filetype javascript setlocal expandtab ts=2 sts=2 sw=2
autocmd Filetype json setlocal expandtab ts=2 sts=2 sw=2
autocmd Filetype react setlocal expandtab ts=2 sts=2 sw=2
autocmd Filetype vue setlocal expandtab ts=2 sts=2 sw=2
autocmd Filetype vue setlocal expandtab ts=2 sts=2 sw=2
autocmd Filetype jsx setlocal expandtab ts=2 sts=2 sw=2
autocmd Filetype typscript setlocal expandtab ts=2 sts=2 sw=2

autocmd Filetype rust setlocal expandtab ts=2 sts=2 sw=2


autocmd Filetype css setlocal expandtab ts=2 sts=2 sw=2
autocmd Filetype scss setlocal expandtab ts=2 sts=2 sw=2
autocmd Filetype sass setlocal expandtab ts=2 sts=2 sw=2

""""""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""
" Deoplete
""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 0
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:deoplete#sources = {}
let g:deoplete#sources.php = ['omni', 'phpactor', 'ultisnips', 'buffer']
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue'
                \ ]

""""""""""""""""""""""""""""""""""
" Ultisnips
""""""""""""""""""""""""""""""""""
let g:ultisnips_php_scalar_types = 1

""""""""""""""""""""""""""""""""""
" Supertab
""""""""""""""""""""""""""""""""""
" Supertab reverses the tab seletion by default
" so this changes back to normalcy
let g:SuperTabDefaultCompletionType = "<c-n>"

