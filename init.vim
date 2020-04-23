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

  " Navigation, display
  call dein#add('preservim/nerdtree')
  call dein#add('junegunn/fzf')
  call dein#add('junegunn/fzf.vim')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('vim-airline/vim-airline')

  call dein#add('tpope/vim-fugitive')

  " Language specs/ Syntax highlighting etc.
  call dein#add('leafgarland/typescript-vim')
  call dein#add('peitalin/vim-jsx-typescript')
  call dein#add('udalov/kotlin-vim')

  " Language Server protocol (servers and client)
  call dein#add('natebosch/vim-lsc')

  " Utilities
  call dein#add('godlygeek/tabular')

  call dein#end()
  call dein#save_state()
endif

" GUI Preferences
set showtabline=2
set showmode

" Set overrides for colorscheme
function! ColorschemeOverrides() abort
  " Use 'nord11' as foreground color for Vim comment titles.
  autocmd ColorScheme nord highlight Comment ctermfg=11 guifg=#8FBCBB
endfunction

augroup ColorschemeOverridesAu
    autocmd!
    autocmd ColorScheme * call ColorschemeOverrides()
augroup END

let g:nord_bold_vertical_split_line = 1 " Brighter vertical split marker

" Favorite colorscheme at the time
colorscheme nord

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

" Load jsx plugin for typescript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" Add fzf to runtimepath
set runtimepath+=/usr/local/opt/fzf

" Highlight current window automatically
augroup HightlightCurrentWindow
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
