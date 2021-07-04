
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileformat=unix               " Only use LF

set directory=/tmp//,~/tmp//,.    " Keep swap files in one location

set hidden                        " Handle multiple buffers better.

set undofile                      " Persistent undo <3

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO: fzf seems to not be automatically loaded. Possibly because this is the vim
" (not nvim) directory?
if filereadable("/usr/share/vim/vimfiles/plugin/fzf.vim")
  source /usr/share/vim/vimfiles/plugin/fzf.vim
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf.vim'

" Languages
" https://github.com/sheerun/vim-polyglot
Plug 'blankname/vim-fish'
Plug 'tpope/vim-git'
Plug 'chr4/nginx.vim'
Plug 'uarun/vim-protobuf'
Plug 'rust-lang/rust.vim'
Plug 'wgwoods/vim-systemd-syntax'

" Linting and make
Plug 'neomake/neomake'

" Snippets and auto completion
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"https://github.com/neovim/neovim/issues/3845#issuecomment-164647435

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DISPLAY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set cursorline                    " Highlight the current line
set number                        " Show line numbers.
set relativenumber                " Show line numbers relative to current line.
set ruler                         " Show cursor position.
set scrolloff=10                  " Show N lines of context around the cursor.

" Colorscheme
colorscheme solarized
set background=dark


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FORMATTING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

map <C-c> "+y<CR>

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk

nmap <c-p> :Files<cr>
nnoremap <Leader>p :Fi <c-r><c-w><CR>
vnoremap <leader>p y:Fi <c-r>"<CR>
command! -bang -nargs=* Fi call fzf#vim#files('.', {'options':'--query '.shellescape(<q-args>)})
nmap <c-o> :Buffers<cr>
nmap <c-i> :Ag<cr>
nnoremap <leader>i :Ag <c-r><c-w><CR>
" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)

let g:deoplete#enable_at_startup = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" When reading a buffer (after 1s), and when writing.
call neomake#configure#automake('rw', 1000)
let g:neomake_open_list = 2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Machine local
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable("~/.nvimrc.local")
  source ~/.nvimrc.local
endif

