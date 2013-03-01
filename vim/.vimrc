" turn off auto adding comments on next line
" so you can cut and paste reliably
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set fo=tcq
set nocompatible
set modeline

call pathogen#infect()
syntax on
filetype plugin indent on

set encoding=utf-8
colorscheme railscasts
set autoindent      " Indent same level as the previous line
set t_Co=256        " 256 colors
set smartindent
map <F3> :set list!

" TABS
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"set listchars=tab:»\ ,trail:·
"set list
cmap w!! %!sudo tee > /dev/null %

" set default comment color to cyan instead of darkblue
" which is not very legible on a black background
highlight comment ctermfg=cyan

highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\  /
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" Show me a ruler
set ruler

" Set up puppet manifest and spec options
au BufRead,BufNewFile *.pp
  \ set filetype=puppet
au BufRead,BufNewFile *_spec.rb
  \ nmap <F8> :!rspec --color %<CR>

" Enable indentation matching for =>'s
filetype plugin indent on

" SEARCH highlight
set incsearch
set hlsearch

" Enable the mouse
"set mouse=a

" Show matching brackets/paranthesis
set showmatch

" Trim whitespace off line-endings on save
autocmd BufWritePre * :%s/\s\+$//e


" Highlight current line only for active window
autocmd BufWinEnter * setlocal cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" On OSX
vmap <D-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <D-v> :call setreg("\"",system("pbpaste"))<CR>p

