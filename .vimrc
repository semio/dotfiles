" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" set nocompatible
set nocompatible

" Idention

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=4
set tabstop=4
set expandtab

" Generals
set number                      "Line numbers are good
set ruler                       "show cursor position all time
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set nowrap                      "Don't wrap lines
set linebreak                   "Wrap lines at convenient points
set splitright                  " Vertical splits use right half of screen
set timeoutlen=1000             " Lower ^[ timeout
set ttimeoutlen=10
set fillchars=fold:\ ,          " get rid of obnoxious '-' characters in folds
set tildeop                     " use ~ to toggle case as an operator, not a motion
if exists('&breakindent')
    set breakindent             " Indent wrapped lines up to the same level
endif

set mouse=a                     " enable mouse


" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Search Settings

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" Swap settings

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·


" filetypes
filetype plugin on
filetype indent on
call pathogen#infect()
" call pathogen#helptags()


" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Color theme
" colorscheme mango
syntax on

" set background=dark
" colorscheme solarized


" ================= Plugins ===================

" airline settings
set laststatus=2
let g:airline_detect_paste=1       " detect paste mode
let g:airline#extensions#tabline#enabled=1 "show airline for tabs too
let g:airline_powerline_fonts=1    "enable powerline fonts

" nerdtree
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

let g:nerdtree_tabs_open_on_colsole_startup=0

" syntastic
"
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntasitc_mode = "passive"
augroup END

" ===================== Misc =====================

" paste problem
"
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
"
set clipboard=unnamed  " share clipboard with osx

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical


" ============ Split and Windows ==============

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


" ============ Norman remappings ============ "
function! SetNormanRemaps()
    " Remap the scrolling keys for norman
    noremap n j|noremap i k|noremap o l|noremap y h
    noremap gn gj|noremap gi go

    " Remap insert keys
    " r to i
    " l to o
    noremap r i|noremap R I
    noremap l o|noremap L O

    " Remap yank and paste keys
    " j to y
    " f to p (this is different from conventional
    "  paste location because ; is in p's location)
    "  f (r in qwerty) is p in Colemak so I'm used to that mapping
    noremap j y|noremap J Y
    noremap f p|noremap F P

    " Remap next key for search
    " p to n
    noremap p n|noremap P N

    " Quicker window movement
    nnoremap <C-k> <C-w>j
    nnoremap <C-j> <C-w>k
    nnoremap <C-l> <C-w>h
    nnoremap <C-h> <C-w>l

endfunction

call SetNormanRemaps()

" ========================================= "

