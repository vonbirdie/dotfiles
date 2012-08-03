call pathogen#runtime_append_all_bundles()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                  " Use vim settings instead of vi settings
set modelines=0
set fileformat=unix               " Only use LF
set encoding=utf-8

set nobackup                      " Make a backup while saving the file
set writebackup                   " 
set directory=/tmp/,~/.vim/tmp/,. " Keep swap files in one location

set hidden                        " Handle multiple buffers better.

set undofile                      " Persistent undo <3

runtime macros/matchit.vim        " Load the matchit plugin.

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

set tabstop=4                     " Global tab width.
set shiftwidth=4                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set autoindent                    " Indent new lines

set backspace=indent,eol,start    " Intuitive backspacing.

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specifics
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/vendor/ruby/*,*/vendor/cache/*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE SPECIFICS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType coffee setlocal tabstop=2 shiftwidth=2 expandtab
