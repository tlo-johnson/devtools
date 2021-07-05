command! UloTodo edit ~/notes/ulo/todo.md

let s:client_root = "~/dev/ulo/client"
let s:server_root = "~/dev/ulo/server"

function! s:UloServer()
  execute 'cd ' . s:server_root
  call RunInTerminal('mongodb-server', 'yarn db:docker')
  call RunInTerminal('dev-server', 'yarn dev')
endfunction

function! s:UloClient()
  execute 'cd ' . s:client_root
  call RunInTerminal('dev-server', 'yarn dev')
endfunction

command! UloClient execute ':cd ' . s:client_root
command! UloRunClient call s:UloClient()

command! UloServer execute ':cd ' . s:server_root
command! UloRunServer call s:UloServer()
