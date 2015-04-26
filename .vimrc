set nocompatible

set backspace=indent,eol,start
syntax on

set number
set showcmd

" file
set encoding=utf-8
set fileencoding=utf-8
"set noswapfile
set swapfile
set nowritebackup
set nobackup
set history=100
set wrap

" indent
set autoindent
set tabstop=4
set shiftwidth=4
set smartindent
set noexpandtab

" search
set ignorecase
set smartcase
set hlsearch
set incsearch
set wrapscan

" match
"set noshowmatch
set showmatch
set matchtime=1


" vim binary mode open with 'xxd' command
augroup BinaryXXD
	autocmd!
	autocmd BufReadPre		*.bin let &binary =1
	autocmd BufReadPost		* if &binary | silent %!xxd -g 1
	autocmd BufReadPost		* set ft=xxd | endif
	autocmd BufWritePre		* if &binary | %!xxd -r | endif
	autocmd BufWritePost	* if &binary | silent %!xxd -g 1
	autocmd BufWritePost	* set nomod | endif
augroup END

" key map when normal mode
nnoremap j gj
nnoremap k gk
" delete character of beginning of line
nnoremap <C-k> _x
" clear screen and `set nohlsearch` when type [Control and 'l']
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" key map when visual mode
vnoremap j gj
vnoremap k gk

" key map when insert mode
"inoremap <C-j> <Esc>
inoremap <C-j> <C-c>
