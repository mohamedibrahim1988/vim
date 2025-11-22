" fzy Command
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    redraw!
    return
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
  exec a:vim_command . " " . output 
  endif
endfunction

nnoremap <leader>f :call FzyCommand("fd --type f -E .git --hidden --follow", ":e")<cr>
nnoremap <leader>ff :call FzyCommand("ag . --silent --hidden --ignore .git -l -g ''", ":e")<cr>
nnoremap <leader>v :call FzyCommand("ag . --silent --hidden --ignore .git -l -g ''", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("ag . --silent --hidden --ignore .git -l -g ''", ":sp")<cr>

" use fzy and ag to search word
function! FzyAg(...)
    let query = join(a:000, ' ')
    let cmd = 'ag --nocolor --nogroup '
        \ . '--ignore .git '
        \ . '--ignore node_modules '
        \ . '--ignore dist '
        \ . '--ignore build '
        \ . '--ignore .cache '
        \ . '--ignore target '
        \ . '--ignore venv '
        \ . '"' . query . '" | fzy'

    let result = systemlist(cmd)

    if empty(result)
        echo "No match found"
        redraw!
        return
    endif

    let parts = split(result[0], ':')
    let file = parts[0]
    let line = parts[1]

    execute 'edit +' . line . ' ' . file
endfunction
command! -nargs=+ FzyAg call FzyAg(<f-args>)
nnoremap <leader>fa :FzyAg 
" use fzy + rg search word
function! FzyRg(...)
    let query = join(a:000, ' ')
    let cmd = 'rg --vimgrep --no-heading '
                \ . '--glob "!{.git,node_modules,dist,build,.cache,target,venv}/**" '
                \ . '"' . query . '" | fzy'

    let result = systemlist(cmd)
    if empty(result)
        echo "No match found"
        redraw!
        return
    endif

    let parts = split(result[0], ':')
    let file = parts[0]
    let line = parts[1]

    execute 'edit +' . line . ' ' . file
endfunction
command! -nargs=+ FzyRg call FzyRg(<f-args>)
nnoremap <leader>fr :FzyRg 

