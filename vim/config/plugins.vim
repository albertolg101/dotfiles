"----------"
" NERDTree "
"----------"

function! NERDTreeMoveCursor()
    if bufname() =~ "NERD_tree\d*"
        call feedkeys("\<C-w>p")
    else
        silent NERDTreeMirror
        call NERDTreeFocus()
    endif
endfunction

let NERDTreeSortHiddenFirst=1   " Show hidden folders first
let NERDTreeIgnore=[".git", "__pycache__"]     " Do not show files in list
let NERDTreeShowHidden=1        " Show hidden files
let NERDTreeShowLineNumbers=1   " Show line numbers

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"--------------"
" Vim devicons "
"--------------"
set guifont=Hack\ Nerd\ Font\ Mono\ 11

"----------------------------------"
" Vim nerdtree syntax highlighting "
"----------------------------------"
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

"---------------"
" Vim Code Dark "
"---------------"
colorscheme codedark

"----------------"
" NERD Commenter "
"----------------"
let g:NERDSpaceDelims = 1       " Add spaces after comment delimiters by default
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)

"-----"
" FZF "
"-----"
set rtp+=~/.dotfiles/lib/fzf
