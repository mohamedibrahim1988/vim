set laststatus=2
set noshowmode
hi Filename ctermbg=238 ctermfg=75 guibg=#444444 guifg=#61afef
hi Fileformat ctermfg=135 ctermbg=235 guifg=#9E6FFE guibg=#282c34
hi Position ctermbg=145 ctermfg=235 guifg=#282c34 guibg=#abb2bf
hi column ctermbg=238 ctermfg=75 guibg=#494b53 guifg=#61afef
let g:currentmode={
   \ 'n'  : 'Noraml ',
   \ 'v'  : 'Visual ',
   \ 'V'  : 'V·Line ',
   \ '' : 'V·Block ',
   \ 's'  : 'Select ',
   \ 'S'  : 'S·Line ',
   \ '' : 'S·Block ',
   \ 'i'  : 'Insert ',
   \ 'R'  : 'Replace ',
   \ 'Rv' : 'V·Replace ',
   \ 'c'  : 'Command ',
   \ 'rm' : 'More ',
   \ 'r?' : 'Confirm ',
   \ '!'  : 'Shell ',
   \ 't'  : 'Terminal '
   \}
function! ChangeStatuslineColor()
 if (mode() =~# '\v(n|no)')
   exe 'hi! StatusLine cterm=Bold ctermfg=238 ctermbg=76 guifg=#494b53 guibg=#3a7d44'
 elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
   exe 'hi! StatusLine cterm=Bold ctermfg=168 ctermbg=176 guifg=#abb2bf guibg=#c678dd'
 elseif (mode() ==# 'i')
   exe 'hi! StatusLine cterm=Bold ctermfg=238 ctermbg=75 guifg=#494b53 guibg=#61afef'
 else
   exe 'hi! StatusLine cterm=Bold ctermfg=168 ctermbg=145 guifg=#abb2bf guibg=#e06c75'
 endif
 return ''
endfunction
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%#Filename#
set statusline+=%F\  " File path, as typed or relative to current directory
set statusline+=%= " Separation point between left and right aligned items
set statusline+=%#Fileformat#
set statusline+=%k\ \|\ %y
set statusline+=\ %{&modified?'[+]\ ':''}
set statusline+=%{&readonly?'\ ':''}
set statusline+=%#Column#
set statusline+=\ [C%2v]
set statusline+=%3l:%L
set statusline+=%#Position#
set statusline+=\ [%2p%%] " Percentage through file in lines as in |CTRL-G|
