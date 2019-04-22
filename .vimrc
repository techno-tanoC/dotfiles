if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/repos/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/repos')
  call dein#begin('~/.vim/repos')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/repos/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  " call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')
  call dein#load_toml('~/.vim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.vim/dein_lazy.toml', {'lazy': 1})

  " You can specify revision/branch/tag.
  " call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

colorscheme molokai

set expandtab shiftwidth=2 tabstop=2 smarttab
" set whichwrap=b,s,h,l,<,>,[,]
set splitright
set noswapfile
set laststatus=2 " for lightline
set conceallevel=0
let g:vim_json_syntax_conceal = 0

autocmd BufRead,BufNewFile *.slim setfiletype slim

" paste
nnoremap <silent> <Space>p :set invpaste paste?<CR>
" Turn off paste mode when leaving insert
" autocmd InsertLeave * set nopaste

nnoremap <S-l> $
nnoremap <S-h> ^

" window
nnoremap <Space> <Nop>
nnoremap <Space>j <C-w>j
nnoremap <Space>k <C-w>k
nnoremap <Space>l <C-w>l
nnoremap <Space>h <C-w>h
nnoremap <Space>J <C-w>J
nnoremap <Space>K <C-w>K
nnoremap <Space>L <C-w>L
nnoremap <Space>H <C-w>H
nnoremap <Space>s <C-w>=
nnoremap <Space>q :<C-u>q<CR>

call submode#enter_with('bufmove', 'n', '', '<Space>>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', '<Space><', '<C-w><')
call submode#enter_with('bufmove', 'n', '', '<Space>+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', '<Space>-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
