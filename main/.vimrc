
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
"set rtp+=~/.local/lib/python3.7/site-packages/powerline/bindings/vim/

" Plugins
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'elixir-editors/vim-elixir'

Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'dense-analysis/ale'
Plugin 'udalov/kotlin-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'davisdude/vim-love-docs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

"execute pathogen#infect()
" Plugins configuration
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1
let g:airline_powerline_fonts = 1

" Visual
syntax on
filetype plugin indent on
set laststatus=2
colorscheme slate
set number relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set list

" Key map
nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTreeToggle<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Pane navigations
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

