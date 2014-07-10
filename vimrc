
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                  " Use vim settings instead of vi settings
set modelines=0
set fileformat=unix               " Only use LF
set encoding=utf-8

set nobackup                      " Make a backup while saving the file
set writebackup                   " 
set directory=/tmp//,~/tmp//,.    " Keep swap files in one location

set hidden                        " Handle multiple buffers better.

set undofile                      " Persistent undo <3

runtime macros/matchit.vim        " Load the matchit plugin.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'leshill/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-endwise'
Plugin 'godlygeek/tabular'
Plugin 'groenewege/vim-less'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'digitaltoad/vim-jade'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-vinegar'
Plugin 'MarcWeber/vim-addon-local-vimrc'
Plugin 'rking/ag.vim'
Plugin 'othree/html5.vim'
Plugin 'airblade/vim-gitgutter'

call vundle#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DISPLAY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set title                         " Set the terminal's title

set number                        " Show line numbers.
set relativenumber                " Show line numbers relative to current line.
set ruler                         " Show cursor position.

" Colorscheme 
colorscheme solarized
set background=dark


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FORMATTING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                     " Turn on syntax highlighting.
filetype plugin on                " Turn on file type detection
filetype indent on                " Turn on indentation

set wrap                          " Turn on line wrapping.
set scrolloff=4                   " Show 4 lines of context around the cursor.

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set autoindent                    " Indent new lines

set backspace=indent,eol,start    " Intuitive backspacing.

set pastetoggle=<F2>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2                  " Always show the status line

set statusline=%f

set statusline+=%y
set statusline+=\ [%c,%l]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search & Replace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Give VIM some sane regex matching
nnoremap / /\v
vnoremap / /\v

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set gdefault                      " Use global by default in substitutions
set showmatch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","                 " Set the leader key to ,

map <leader>tt :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>

map <leader>n :bn<cr>
map <leader>bd :bd<cr>

map <C-m> :w<CR>:make<CR>:cw<CR>

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Remap ultisnips to work with ycm
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specifics
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/vendor/ruby/*,*/vendor/cache/*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE SPECIFICS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
