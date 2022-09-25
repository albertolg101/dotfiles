set nocompatible    " not vi compatible "

"-------------------"
" Syntax and indent "
"-------------------"
syntax on " turn on syntax highlighting "
set showmatch " show matching braces when text indicator is over them "
set autoindent

" highlight current line, but only in active window "
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

"----------------------"
" Basic editing config "
"----------------------"
set nu " number lines "
set rnu " relative line numbering "
set incsearch " incremental search (as string is being typed) "
set hls " highlight search "
set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces "
set lbr " line break "
set scrolloff=5 " show lines above and below cursor (when possible) "
set noshowmode " hide mode "
set laststatus=2
set backspace=indent,eol,start " allow backspacing over everything "
set hidden " allow auto-hiding of edited buffers "
set nojoinspaces " suppress inserting two spaces between sentences "
" use 4 spaces instead of tabs during formatting "
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" smart case-sensitive search "
set ignorecase
set smartcase
" tab completion for files/bufferss "
set wildmode=longest,list
set wildmenu
set mouse+=a " enable mouse mode (scrolling, selection, etc) "

" open new split panes to right and bottom, which feels more natural "
set splitbelow
set splitright

" quicker window movement "
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" toggle relative numbering "
nnoremap <C-n> :set rnu!<CR>

" save read-only files "
command -nargs=0 Sudow w !sudo tee % >/dev/null

"----------------------"
" Local customizations "
"----------------------"

" local customizations in ~/.vimrc_local "
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
