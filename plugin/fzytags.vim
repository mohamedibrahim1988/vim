" Execute shell command and Vim command
function! Fzyexecute(shell_command, vim_command)
  let output = ''
  let output = system(a:shell_command)
  redraw!
  " Check if the command executed successfully and output is not empty
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output  
  else
    echo "Error executing command or no output!"
  endif
endfunction
function! Fzy_buffer()
  let tmp = tempname()

  exec 'redir > '.tmp | silent ls | redir END

  let $V_BUFFER_FILE = tmp
  let shell_cmd = 'cat $V_BUFFER_FILE |' .
        \ 'tail -n +2 |' .
        \ 'sed -r ''s/.*"(.+)".*/\1/'' |' .
        \ 'fzy'

 :call Fzyexecute(shell_cmd, 'buffer')
endfunction


" Define variable command & map shell command to Vim commands
function! Fzyvariable_command(shell_cmd, prefixes, name)
  for [prefix, excmd] in items(a:prefixes)
    " Use prefix only if it's not 'default'
    let cmd_name = (prefix == 'default' ? a:name : prefix . a:name)

    " Define the command that calls Fzyexecute
    exec 'command! ' . cmd_name .
         \ ' call Fzyexecute("' . a:shell_cmd . '", "' . excmd . '")'
  endfor
endfunction

" Define tag navigation prefixes
let s:tags_navigation_prefixes = {
      \ 'V'       : 'vsplit | tag',
      \ 'S'       : 'split | tag',
      \ 'T'       : 'tabedit | tag',
      \ 'E'       : 'edit | tag',
      \ 'default' : 'edit | tag',
      \ }

let s:tags_sh = 'cat tags | cut -f 1 | fzy'

" Call Fzyvariable_command for tags
call Fzyvariable_command(s:tags_sh, s:tags_navigation_prefixes, 'FzyTag')

" Define the default FzyTag command
command! FzyTag call Fzyexecute(s:tags_sh, 'tag')
command! FzyBuffer :call Fzy_buffer()

nnoremap <LocalLeader>fe :EFzyTag<cr>
nnoremap <LocalLeader>fv :VFzyTag<cr>
nnoremap <LocalLeader>fs :SFzyTag<cr>
nnoremap <LocalLeader>ft :TFzyTag<cr>
nnoremap <leader>b :FzyBuffer<cr>
