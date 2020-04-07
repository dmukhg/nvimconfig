if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

" GUI Preferences
set showtabline=2
set showmode

" Favorite colorscheme at the time
colorscheme monokai

filetype plugin indent on
syntax enable

" Expand tabs
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

" Line length
setl tw=120
set formatoptions+=t " Hard wrap at 120 characters



