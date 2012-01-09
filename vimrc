call pathogen#runtime_append_all_bundles()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                  " Use vim settings instead of vi settings
set fileformat=unix

set nobackup                      " Make a backup while saving the file
set writebackup                   " 
set directory=/tmp/,~/.vim/tmp/,. " Keep swap files in one location

set hidden                        " Handle multiple buffers better.

runtime macros/matchit.vim        " Load the matchit plugin.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DISPLAY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set title                         " Set the terminal's title

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

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

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

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

map <leader>f :LustyFilesystemExplorer<cr>
map <leader>b :LustyBufferExplorer<cr>

map <C-m> :w<CR>:make<CR>:cw<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGE SPECIFICS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
