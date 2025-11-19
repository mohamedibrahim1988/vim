" Mappings {{{
let maplocalleader = "\\"
let mapleader = "\<Space>"

" Normal Mode
nnoremap <SPACE> <Nop>
nnoremap <leader>w :w<CR>
nnoremap <LocalLeader>t :term<CR>
nnoremap n nzzzv 
nnoremap N Nzzzv
" Vertical scroll and center
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
" }}}
" Navigations {{{
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l 
" Resize split windows using arrow keys by pressing:
noremap <c-up> :resize -2<Cr> 
noremap <c-down> :resize +2<Cr>
noremap <c-left> :vertical resize -2<Cr>
noremap <c-right> :vertical resize +2<Cr>
" }}}
" Substitute word under cursor on line
nnoremap <leader>s :s/\<<C-r><C-w>\>//gI<Left><Left><Left>
" cycle through buffers/files
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
"delete buffus
nnoremap <silent> X :bd<CR>
" Make gf (go to file) create the file, if not existent
nnoremap <C-w>gf :tabe<cfile><CR>
" use ,gf to go to file in a vertical split
nnoremap <silent> ,gf   :vsplit <cfile><CR>
nnoremap <silent> <leader>gf <c-w>F<CR>
" /home/mohamed/.config/bash/bashrc
" copy filepath/pwd to clipboard
nnoremap yf :let @+ = expand('%:p')<CR>
nnoremap <silent> yd :let @+ = expand('%:p:h')<CR>
" move text up and down
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
" Yank from cursor to the end of line.
nnoremap Y y$
" Yank to clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p
" Visual Mode
vnoremap / y/<C-R>"<CR>
vnoremap p "_dP
" yank/paste to clipboard
vnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" Insert Mode
inoremap jk <esc>

" Terminal
tnoremap <C-h> <C-\><C-n><C-w>h 
tnoremap <C-j> <C-\><C-n><C-w>j 
tnoremap <C-k> <C-\><C-n><C-w>k 
tnoremap <C-l> <C-\><C-n><C-w>l 
tnoremap jk <C-\><C-n>
