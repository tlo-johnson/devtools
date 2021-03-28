command! StokeTodo edit ~/notes/stoke/todo.md

function! s:StokeApi()
  cd ~/dev/stoke/api
endfunction

function! s:StokePortal()
  cd ~/dev/stoke/portal
  call RunInTerminal('dev-server', 'yarn start')
endfunction

command! StokeApi call s:StokeApi()
command! StokePortal call s:StokePortal()
