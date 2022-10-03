" leader
let mapleader = " "

" quicker window movement 
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-p> <C-w>p

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" NERDTree
nnoremap <leader>n :call NERDTreeMoveCursor()<CR>
nnoremap <C-b> :NERDTreeToggle<CR>

" FZF
nnoremap <leader>t :FZF<CR>
