syntax on

set nocompatible
set encoding=utf-8
set clipboard=unnamedplus
set number
set nobackup
set nowrap
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set incsearch

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4

let mapleader = " "

vnoremap <leader>y :w !xclip -selection clipboard<CR><CR>

nnoremap <leader>p :read !xclip -selection clipboard -o<CR>
nnoremap <leader><Bar> :vsplit<CR>
nnoremap <leader>- :split<CR>
nnoremap <leader>bd :bdelete<CR>
