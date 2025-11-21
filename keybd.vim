function! EngType()
    " Remove word in input mode
    inoremap jj <c-w>
    set keymap=us-altlatin
    set norightleft
    set spelllang=en_us
    set spell
endfunction
" Switch to Arabic
function! AraType()
    iunmap jj
    set keymap=arabic-pc
    set rightleft
    set nospell
endfunction
" Switch to English typing
nnoremap <Leader>e :<C-U>call EngType()<CR>
call EngType() " Do this on startup
" Switch to Arabic typing
nnoremap <Leader>a :<C-U>call AraType()<CR>   
