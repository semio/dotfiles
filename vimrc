" Tabs
set ai
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"
set nu


" filetypes
filetype plugin on
call pathogen#infect()

" Color theme
syntax on 
set background=dark
colorscheme solarized


" paste problem
"
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
" 
