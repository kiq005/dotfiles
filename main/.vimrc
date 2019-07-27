
set nocompatible
filetype off

" Vundle plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on

" Pathogen
execute pathogen#infect()

" 
set laststatus=2

" Visual
colorscheme slate
syntax on
set number relativenumber

" Key map
nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTreeToggle<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

