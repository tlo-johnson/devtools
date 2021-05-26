function! s:UloServer()
  cd ~/dev/ulo/server
  call RunInTerminal('mongodb-client', 'yarn db:docker')
  call RunInTerminal('node-dev', 'yarn start')
endfunction

function! s:UloClient()
  cd ~/dev/ulo/client
  call RunInTerminal('react-scripts', 'yarn start')
endfunction

command! UloRunServer call s:UloServer()
command! UloRunClient call s:UloClient()
