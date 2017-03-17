" Wrap properly at line end
set whichwrap=b,s,<,>,[,],h,l
set backspace=eol,start,indent

" Highlight search results
set hlsearch

" Show matching parentheses
set showmatch
set mat=2

" Color scheme
syntax enable
colorscheme monokai
set background=dark

highlight Normal ctermbg=Black
"highlight NonText ctermbg=Black

set number
" Tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Brackets
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O

set ai " Auto indent
set si " Smart indent

imap jk <Esc>

" Need vim-gtk to work with system clipboard
vnoremap <C-c> "+y
set mouse=a

" Split navigation

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

