set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'vim-airline/vim-airline'
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'
Plugin 'preservim/nerdcommenter'
call vundle#end()

filetype plugin indent on
colorscheme dracula
syntax enable
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set encoding=UTF-8
set background=dark
set termguicolors
set mouse=a
set number
set noswapfile
set nowrap
set autoread
set ignorecase
set encoding=UTF-8

au BufRead,BufNewFile *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

nnoremap <C-n> :NERDTreeToggle<CR>

let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
let g:airline#extensions#tabline#enabled=1

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
