" ~/.vimrc — sensible no-plugin config (Vim 9.2)

" ── Core behavior ─────────────────────────────────────────────
set nocompatible              " use Vim defaults, not Vi
filetype plugin indent on     " filetype detection + per-type indent
syntax on                     " syntax highlighting
set encoding=utf-8
set hidden                    " switch buffers without saving
set autoread                  " reload files changed outside Vim
set mouse=a                   " mouse support in all modes
set ttimeoutlen=10            " faster <Esc> response
set updatetime=300

" ── UI ────────────────────────────────────────────────────────
set number relativenumber     " hybrid line numbers
set cursorline                " highlight current line
set showcmd                   " show partial command
set wildmenu                  " better command-line completion
set wildmode=longest:full,full
set scrolloff=5               " keep context around cursor
set sidescrolloff=8
set signcolumn=yes            " stable gutter (no text jump)
set laststatus=2              " always show status line
set ruler
set termguicolors             " 24-bit color
set background=dark
set splitright splitbelow     " more natural splits
set list listchars=tab:»·,trail:·,nbsp:␣

" ── Indentation (2 spaces default; Python overrides to 4) ─────
set expandtab                 " spaces, not tabs
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent smartindent
set shiftround                " round indent to multiple of shiftwidth

" ── Search ────────────────────────────────────────────────────
set ignorecase smartcase      " case-insensitive unless capital used
set incsearch hlsearch        " incremental + highlighted search
set gdefault                  " :s applies to whole line by default

" ── Files / backups / persistent undo ─────────────────────────
set noswapfile nobackup nowritebackup
set undofile
set undodir=~/.vim/undo//
if !isdirectory($HOME . '/.vim/undo')
  call mkdir($HOME . '/.vim/undo', 'p', 0700)
endif

" ── Clipboard ─────────────────────────────────────────────────
if has('clipboard')
  set clipboard=unnamedplus    " yank/paste via system clipboard
endif

" ── Key mappings ──────────────────────────────────────────────
let mapleader = " "            " Space as leader
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader><Space> :nohlsearch<CR>
" move by visual lines on wrapped text
nnoremap j gj
nnoremap k gk
" keep selection after indenting
vnoremap < <gv
vnoremap > >gv
" window navigation with Ctrl+hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ── Per-filetype tweaks ───────────────────────────────────────
augroup filetype_indent
  autocmd!
  " Python: PEP 8 — 4 spaces, ruler at 88 (Black) cols, no auto comment-leader on o/O
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
        \ textwidth=88 colorcolumn=89 formatoptions-=o formatoptions+=croqj
  autocmd FileType make setlocal noexpandtab
  autocmd FileType markdown,gitcommit setlocal spell
augroup END

" restore last cursor position when reopening a file
augroup remember_position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
