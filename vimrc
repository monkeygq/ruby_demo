set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-markdown'
Plugin 'racer-rust/vim-racer'
Plugin 'rust-lang/rust.vim'
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'vim-jp/vim-go-extra'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'

call vundle#end()
filetype plugin indent on

syntax enable
"set background=dark
"colorscheme solarized

set number
set cursorline
set ruler
set hlsearch

set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab

au FileType python setl ts=4 sw=4 sts=4 et

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
