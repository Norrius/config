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

set ai "Auto indent
set si "Smart indent

imap jk <Esc>