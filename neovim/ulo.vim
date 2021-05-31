command! UloTodo edit ~/notes/ulo/todo.md

function! s:UloServer()
  cd ~/dev/ulo/server
  call RunInTerminal('mongodb-server', 'yarn db:docker')
  call RunInTerminal('dev-server', 'yarn dev')
endfunction

function! s:UloClient()
  cd ~/dev/ulo/client
  call RunInTerminal('react-scripts', 'yarn start')
endfunction

command! UloRunServer call s:UloServer()
command! UloRunClient call s:UloClient()
