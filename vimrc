
" ===================================================
" .vimrc
" for Vim7.4
"
" S.Shimada
" Nov. 18, 2015
" ===================================================

set nocompatible "IMproved

syntax on
filetype plugin on
"filetype indent on

" --- common setting ---
set title
set backspace=indent,eol,start
set number
set nocursorline
set cmdheight=1
set ruler
set wildmenu
set list
set listchars=tab:>\ ,extends:< 
"set listchars+=eol:<
" ---------------------------

" --- color scheme list up ---
colorscheme default
"colorscheme elflord
"colorscheme blue
"colorscheme darkblue
"colorscheme delek
"colorscheme koehler
"colorscheme morning
"colorscheme murphy
"colorscheme pablo
"colorscheme peachpuff
"colorscheme desert
"colorscheme evening
"colorscheme ron
"colorscheme shine
"colorscheme slate
"colorscheme torte
"colorscheme zellner
" ---------------------------

" --- file ---
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set swapfile
set nowritebackup
set nobackup
set history=100
set wrap
" ---------------------------

" --- indent ---
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=0
set noexpandtab
" ---------------------------

" --- search ---
set ignorecase
set smartcase
set hlsearch
set incsearch
set wrapscan
" ---------------------------

" --- match ---
set showmatch
set matchtime=1
" ---------------------------

" --- status line ---
set laststatus=2
set showcmd
" file number
set statusline=[%n]
" host name
set statusline+=%{matchstr(hostname(),'\\w\\+')}@
" file name
set statusline+=%<%F
" is edited
set statusline+=%m
" is readonly
set statusline+=%r
" show file format
set statusline+=[%{&fileformat}]
" show encoding
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
" show file type
set statusline+=%y
" ---------------------------

" file open to binary mode with 'xxd' command
augroup BinaryXXD
	autocmd!
	autocmd BufReadPre		*.bin let &binary =1
	autocmd BufReadPost		* if &binary | silent %!xxd -g 1
	autocmd BufReadPost		* set ft=xxd | endif
	autocmd BufWritePre		* if &binary | %!xxd -r | endif
	autocmd BufWritePost	* if &binary | silent %!xxd -g 1
	autocmd BufWritePost	* set nomod | endif
augroup END

" file open to python mode
autocmd FileType python setlocal autoindent
autocmd FileType python setlocal smartindent cinwords=if,elif,else,for,while,tyr,except,finally,def,class
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" [key map when normal mode]
nnoremap j gj
nnoremap k gk
" delete character of beginning of line
nnoremap <C-k> _x
" clear screen and `set nohlsearch` when type [Control and 'l']
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" [Control and 'e'] read file with file encoding 'cp932'
nnoremap <C-e> :e ++enc=cp932<CR>

" [key map when visual mode]
vnoremap j gj
vnoremap k gk

" [key map when insert mode]
"inoremap <C-j> <Esc>
inoremap <C-j> <C-c>
" automatically closes open parentheses
"inoremap { {}<LEFT>
"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>
"inoremap < <><LEFT>

" use Emacs key setting when insert mode
inoremap <C-b> <Left>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>

" [key map when command mode]
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

