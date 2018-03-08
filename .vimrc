execute pathogen#infect()
filetype plugin on
syntax enable
set background=dark
"colorscheme solarized


" first, enable status line always
set laststatus=2

set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%5*%{&ff}%*            "file format
"set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04B\ %*          "character under cursor

hi User1 term=inverse,bold cterm=inverse,bold ctermfg=darkblue "
hi User1 term=inverse,bold cterm=inverse,bold ctermbg=white "
"hi User2 term=inverse,bold cterm=inverse,bold ctermfg=white " total lines color
hi User3 term=inverse,bold cterm=inverse,bold ctermfg=green
hi User4 term=inverse,bold cterm=inverse,bold ctermfg=darkgreen "path color

set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set backspace=indent,eol,start  "Allow backspace in insert mode
set visualbell                  "No TING!!
set showmode
set showcmd
set hlsearch

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    au BufNewFile,BufReadPost *.go set expandtab!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
endif
