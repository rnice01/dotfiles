set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'wycats/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'arcticicestudio/nord-vim'
Plugin 'rakr/vim-two-firewatch'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'posva/vim-vue'
Plugin 'Shougo/deoplete.nvim'
Plugin 'sirver/ultisnips'
Plugin 'w0rp/ale'
call vundle#end()            " required
filetype plugin indent on    " required


""""""""""""""""""""""""""""""""""
" Plugin Configs
""""""""""""""""""""""""""""""""""
let g:NERDDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

""""""""""""""""""""""""""""""""""""
" GUI
""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark
colo nord

set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
set guifont=Hack:h11

hi MatchParen gui=bold guibg=NONE guifg=lightblue cterm=bold cterm=NONE

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

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
	set nolazyredraw
  else
    set relativenumber
	set lazyredraw
  endif
endfunc

nnoremap <leader>n :call NumberToggle()<CR>

" Move to first non blank character
" on current line
nmap ^ 0


""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start
set ruler
set number
set visualbell
set ignorecase

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Undo
set undofile
set undolevels=5000
set undodir=~/.vim/undo


""""""""""""""""""""""""""""""""""
" File Type Indentations
""""""""""""""""""""""""""""""""""
autocmd Filetype cs setlocal smarttab cindent autoindent noexpandtab ts=4 sts=4 sw=4
autocmd Filetype php setlocal smarttab cindent autoindent noexpandtab ts=4 sts=4 sw=4
autocmd Filetype ruby setlocal ts=2  sw=2 expandtab
autocmd Filetype javascript setlocal ts=2  sw=2 expandtab
autocmd Filetype jsx setlocal ts=2  sw=2 expandtab
autocmd Filetype pug setlocal ts=2  sw=2 expandtab
autocmd Filetype vue setlocal ts=2  sw=2 expandtab
autocmd Filetype sass setlocal ts=2  sw=2 expandtab


""""""""""""""""""""""""""""""""""
" OmniSharp Configs
""""""""""""""""""""""""""""""""""

let g:OmniSharp_server_path = 'C:\OmniSharp\OmniSharp.exe'
let g:OmniSharp_selector_ui = 'ctrlp'
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:deoplete#enable_at_startup = 1
set completeopt=longest,menuone,preview

augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>


    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Add syntax highlighting for types and interfaces
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>
