set nocompatible
filetype off

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'moll/vim-bbye'
Plugin 'jiangmiao/auto-pairs'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'fatih/vim-go'
"SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

call vundle#end()
filetype plugin indent on


" Dont like *.swp files
set nobackup

" Buffers (I want to change betwen buffers unsaved!)
set hidden

" Welcome to the 21st century
set encoding=utf-8

" Colors
set t_Co=256
colorscheme notangotan
syntax on

" Auto char comment in new line
set formatoptions+=r

" Always show a status line
set laststatus=2
"set statusline=%<[%n]\ %F\ %y\ %r\ %1*%m%*%w%=%-10(%l,%c%V%)\ %P/%-6L\ HEX=%-4(%B%)

" Show line numbers
set number

" Mark trailing white space
" (very useful to see no printable characters)
set list listchars=tab:›\ ,trail:·,eol:¬

" Show matching brackets/parenthesis
set showmatch

" Code folders
set foldmethod=marker
"set foldmethod=expr

" Turn on auto/smart indenting
set autoindent
set nosmartindent

" Make <tab> and <backspace> smarter
set smarttab

" Spaces for <tab>
set tabstop=4
set shiftwidth=4

" Use spaces, no tabs
set expandtab

" Ignore case in searchs
set ignorecase

" Highligh all search matches
set hlsearch

" Show search as you type
set incsearch

" Not beep
set vb

" ============================================================================
" Sets by filetype
" ============================================================================
autocmd FileType python set omnifunc=pythoncomplete#Complete ai et ts=4 sts=4 sw=4 cc=80
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP ai et ts=4 sts=4 sw=4
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType snippet set nofoldenable syntax=off
autocmd FileType taskpaper set nonu ts=2 sw=2 et
autocmd FileType vimwiki set nonu ts=2 sw=2 et
autocmd FileType lua set omnifunc=luacomplete#Complete ai et ts=4 sts=4 sw=4

" Twig
autocmd BufNewFile,BufRead *.twig set filetype=html.twig
" Arduino
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
" Jade
autocmd BufNewFile,BufRead *.jade set filetype=jade
" HTML
autocmd BufNewFile,BufRead *.html set filetype=html.javascript ts=2 sts=2 sw=2
" JS
autocmd BufNewFile,BufRead *.js set filetype=javascript ts=2 sts=2 sw=2

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" NerdTree
map <F3> :NERDTreeToggle<CR>

" NERDTree window width by hostname (different screen resolution)
if hostname() == 'howl'
	let g:NERDTreeWinSize = 20
else
	let g:NERDTreeWinSize = 40
endif

let g:NERDTreeWinPos = "right"
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc$', '\~$']

" FuzzyFinder
nnoremap <silent> sj :FufBuffer<CR>
nnoremap <silent> sk :FufFile<CR>

" Buffers
nmap <C-n> :bnext!<CR>
nmap <C-p> :bprevious!<CR>
cnoremap qq Bdelete

" Split window
nmap <C-o> :sp<CR>
nmap <S-e> :vs<CR>

" Jump to another window
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Now I have not C-j for join
nmap <C-i> :join<CR>

" Resize window
nmap <S-j> <C-w>+
nmap <S-k> <C-w>-
nmap <S-h> <C-w><
nmap <S-l> <C-w>>

" Check php file syntax
"map <C-b> :! php -l %<CR>

" Underline actual line
nmap <silent> <C-_> :set cursorline!<CR>

" Highlight actual column
nmap <silent> ,cc :set cursorcolumn!<CR>

" Save as sudo
ca w!! w !sudo tee "%"

" PHP
let mapleader=","
map <leader>t :w\|:!phpunit --colors %<CR>
map <leader>l :w\|:!php -S localhost:3005<CR>
map <leader>c :w\|:!php -l %<CR>
map <leader>f :w\|:!php-cs-fixer fix % --level=all<CR>
