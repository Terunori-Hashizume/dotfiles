set nocompatible
set encoding=utf-8
set fileencoding=utf-8

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'plasticboy/vim-markdown'
call plug#end()

syntax on
set expandtab
set tabstop=4
set shiftwidth=4
set nobackup
set noswapfile
set autoread
set relativenumber
set ruler
set splitright
set autoindent
set smartindent
set foldmethod=syntax
set nofoldenable
set foldcolumn=0
set virtualedit=onemore
set visualbell
set showmatch
set incsearch
set hlsearch
set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest,full

set laststatus=2
set statusline=
set statusline+=%1*\ %f
set statusline+=%1*\ %m
set statusline+=%1*%=
set statusline+=%1*\ \ %l:%c
set statusline+=%1*\ \ %{&fileencoding} 
set statusline+=%1*\ \ %y
set statusline+=%1*\  

set bg=dark
if (has('gui'))
    colorscheme NeoSolarized
else
    set t_Co=256
    colorscheme NeoSolarized
endif

hi clear CursorLineNR
hi NonText guifg=bg ctermfg=bg
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi FoldColumn guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE


let mapleader = "\<Space>"

" set find path
set path+=~/memo/
set path+=~/config/

" enable yank till end
nnoremap Y y$
" make go-to-line easy
nnoremap <CR> G

" {}
set showmatch

" To type easily
nnoremap <Leader>a ^
nnoremap <Leader>e $
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>ex :Ex<CR>
nnoremap <Leader>f :find<Space>
nnoremap <silent> <Leader>hl :help<BAR>only<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Centering
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" To move easily in insert mode
inoremap jk <Esc>
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-j> <CR>

" To move easily in command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" When dealing with Japanese words
nnoremap っj <Esc>
nnoremap っd dd
nnoremap っc cc
nnoremap っy yy
nnoremap っz zz
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap え e
nnoremap お o

" buffer
nnoremap <silent> [b :bprev<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <Leader>db :bdelete<CR>
nnoremap <Leader>lb :ls<CR>

" tab
nnoremap <Leader>te :tabedit<Space>
nnoremap <Leader>tp :tabprev<CR>
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tc :tabclose<CR>

" configure a file easily
nnoremap <Leader>vi :e ~/.vimrc<CR>
nnoremap <Leader>zr :e ~/.zshrc<CR>
nnoremap <Leader>ze :e ~/.zshenv<CR>
nnoremap <Leader>tm :e ~/.tmux.conf<CR>

" source a file
nnoremap <F5> :source ~/.vimrc<CR>
nnoremap <Leader><F5> :!source ~/.zshrc<CR>

" plugins
" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> 
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_autoclose_preview_window_after_insertion = 1
set splitbelow
" for cpp completion
augroup cpp-path
    autocmd!
    autocmd FileType cpp setlocal path=.,/usr/local/include
augroup END


" aoj

" run code without test cases
nnoremap <Leader>rn :lcd %:h<CR>:!~/kyo_pro/tools/run.sh %:t<CR>
" run code with test cases
nnoremap <Leader>rt :lcd %:h<CR>:!~/kyo_pro/tools/run_test_cases.sh %:t<CR>

" yank all texts to clipboard
nnoremap <Leader>ya ggVG"+y

" delete all texts (using when deleting all test cases)
nnoremap <Leader>da ggVGd
