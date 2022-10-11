"--------"
" Global "
"--------"
set nocompatible                " not vi compatible
set encoding=utf8

"-------------------"
" Syntax and indent "
"-------------------"
syntax on                       " turn on syntax highlighting 
set showmatch                   " show matching braces when text indicator is over them
set autoindent

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" Persistent folds between sessions
" augroup AutoSaveGroup
"   autocmd!
"   " view files are about 500 bytes
"   " bufleave but not bufwinleave captures closing 2nd tab
"   " nested is needed by bufwrite* (if triggered via other autocmd)
"   " BufHidden for compatibility with `set hidden`
"   autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
"   autocmd BufWinEnter ?* silent! loadview
" augroup end

set viewoptions=cursor
set foldmethod=syntax
set foldlevelstart=1

"----------------------"
" Basic editing config "
"----------------------"
set nu                          " number lines
set rnu                         " relative line numbering
set incsearch                   " incremental search (as string is being typed)
set hls                         " highlight search
set listchars=tab:>>,nbsp:~     " set list to see tabs and non-breakable spaces
set lbr                         " line break
set scrolloff=5                 " show lines above and below cursor (when possible)
set noshowmode                  " hide mode
set laststatus=2                " always show status bar
set backspace=indent,eol,start  " allow backspacing over everything
set hidden                      " allow auto-hiding of edited buffers
set nojoinspaces                " suppress inserting two spaces between sentences
set mouse+=a                    " enable mouse mode (scrolling, selection, etc)

" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" smart case-sensitive search
set ignorecase
set smartcase

" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
