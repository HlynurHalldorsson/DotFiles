set nocompatible
filetype off 

set rtp+=~/.vim/bundle/vundle

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'mattn/emmet-vim'
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'wikitopian/hardmode'
Plugin 'scrooloose/nerdtree'
Plugin 'Townk/vim-autoclose'
Plugin 'bling/vim-airline'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'klen/python-mode'
Plugin 'rodjek/vim-puppet'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable

set visualbell t_vb=
set encoding=utf8
set fenc=utf8
set t_Co=256
set ffs=unix,dos,mac

set undofile
set undodir=~/.vim/undo

set undolevels=1000
set undoreload=1000
set history=5000
set number                                        " Numbered lines 
set incsearch                                     " Jumps to next match while typing
set smartcase
set ignorecase
set nowritebackup
set nobackup   
set noswapfile
set nu
set guioptions-=r 
set guioptions-=T
set guioptions-=L
set gfn=Monaco:h14
" ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=.git/*,.hg/*,.svn/*
set wildmode=list:full

" Automatically re-read files on change
set autoread

" Set horizontal and vertical lines
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

"Bindings
let mapleader = "," "Set the leader as ,
let g:mapleader = ","
" To open a new empty buffer
" " This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap gt :bnext<CR>
" Move to the previous buffer
nmap gT :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>br :bp <BAR> bd #<CR>
nmap <leader>bw :bw<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>
" Map ,r to reload file
nmap <leader>r :e<CR>
" Rebind ctrl-p to invoke ctrlp in mixed mode.

" Bind Shift enter to open a newline without insert mode
" and CMD + Shift to open a newline and stay in same line
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

let g:ctrlp_map = '<c-u>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_clear_cache_on_exit = 0     " Cache ctrlp results

" Bind <leader>g to jump to definition using ctags.
nnoremap <leader>g :CtrlPTag<cr>

autocmd InsertEnter * silent! :set norelativenumber
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber

let g:pymode_rope = 0 
let g:syntastic_ignore_files = ['\.py$']

"Airline options
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1      " Enable the list of
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename

try
    let g:hybrid_use_iTerm_colors = 1
    colorscheme hybrid
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry

" Bind ctrl+t to toggle tagbar.
nmap <C-t> :TagbarToggle<CR>

" Pymode configuration
let g:pymode_rope_lookup_project = 0
let g:pymode_doc = 0
let g:pymode_folding = 0
let g:syntastic_javascript_checkers = ['jslint']
set completeopt-=preview

map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

nmap <leader>c \"*yy<cr>
nmap <leader>gp :! git pull<cr>
nmap <leader>push :! push "
nmap <leader>pp \"*p<cr>
nmap <leader>PP \"*P<cr>
nmap <leader>w :w!<cr>
nmap <leader>e :e 
nmap <leader>. :q<cr>
nmap <leader>ss :source ~/.vimrc<cr>

" tab/spaces
set softtabstop=4 shiftwidth=4 expandtab
autocmd FileType java :setlocal sw=4 ts=4 sts=4
autocmd FileType cpp setlocal sw=4 ts=4 sts=4
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType css :setlocal sw=2 ts=2 sts=2
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType clj :setlocal sw=2 ts=2 sts=2
autocmd FileType cljs :setlocal sw=2 ts=2 sts=2
autocmd FileType py :setlocal sw=4 ts=4 sts=4

nmap <leader>hard :call HardMode()
nmap <leader>easy :call EasyMode()
map <leader>ind mzgg=G`z<CR>

nmap <C-i> :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>n :NERDTree<cr> "I'm probably never gonna use this.
nmap <leader>p :exec '!python' shellescape(@%, 1)<cr>
"" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" Remember info about open buffers on close
set viminfo^=%

" Mapp ff to escape insert mode 
inoremap ff <esc>
inoremap jj <esc>

" because i have switched numbers and symbols i remap them 
" in command mode
noremap ! 1
noremap @ 2
noremap # 3
noremap $ 4
noremap % 5
noremap ^ 6
noremap & 7
noremap * 8
noremap ( 9
noremap ) 0

noremap 1 !
noremap 2 @
noremap 3 #
noremap 4 $
noremap 5 %
noremap 6 ^
noremap 7 7
noremap 2 @
noremap 2 @
noremap 2 @


" Disable arrow keys :(
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
