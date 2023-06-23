syntax enable
set autoindent expandtab tabstop=2 shiftwidth=2
set encoding=UTF-8
set background=dark
set termguicolors
set mouse=a
set number
set noswapfile
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap
set autoread
set ignorecase
set encoding=UTF-8

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'vim-airline/vim-airline'
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
call vundle#end()
filetype plugin indent on

colorscheme dracula

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>
