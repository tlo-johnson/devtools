command! UloTodo edit ~/notes/ulo/todo.md

let client_root = "~/dev/ulo/client"
let server_root = "~/dev/ulo/server"

function! s:UloServer()
  execute 'cd ' . server_root
  call RunInTerminal('mongodb-server', 'yarn db:docker')
  call RunInTerminal('dev-server', 'yarn dev')
endfunction

function! s:UloClient()
  execute 'cd ' . client_root
  call RunInTerminal('dev-server', 'yarn dev')
endfunction

command! UloClient execute ':cd ' . client_root
command! UloServer execute ':cd ' . server_root
command! UloRunServer call s:UloServer()
command! UloRunClient call s:UloClient()
