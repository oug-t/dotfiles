" Meta
autocmd BufWritePost .vimrc source %
set nocompatible

" General
syntax on
set encoding=utf-8
set mouse=a
set number relativenumber

" Search
set hlsearch ignorecase smartcase

" Indentation 
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set autoindent smartindent

" Wrapping
set wrap linebreak showbreak=...

" Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal
if has('terminal')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  nnoremap <leader>t :botright 10terminal<CR>
  autocmd TerminalOpen * startinsert
endif

" Languages 
autocmd FileType ruby   setlocal ts=2 sw=2 sts=2 et
autocmd FileType python setlocal ts=4 sw=4 sts=4 et colorcolumn=88
let g:python_highlight_all = 1

" Colors
colorscheme zaibatsu
