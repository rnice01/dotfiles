set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'bling/vim-airline'
Plugin 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'kien/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'shougo/deoplete.nvim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'VundleVim/Vundle.vim'
call vundle#end()            " required
filetype plugin indent on    " required

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
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue'
                \ ]

""""""""""""""""""""""""""""""""""
" Nerdtree
""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35

""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp)|(\.(swp|ico|git|svn))$'

""""""""""""""""""""""""""""""""""""
" GUI
""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark
colo gruvbox
let g:gruvbox_contrast_dark='dark'

set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
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

" Rspec plugin keymaps
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

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
autocmd Filetype php setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
