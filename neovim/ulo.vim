function! s:UloServer()
  cd ~/dev/ulomobilespa/server
  call RunInTerminal('mongodb-client', 'mongo')
  call RunInTerminal('node-dev', 'yarn start')
endfunction

function! s:UloClient()
  cd ~/dev/ulomobilespa/client
  call RunInTerminal('react-scripts', 'yarn start')
endfunction

command! UloRunServer call s:UloServer()
command! UloRunClient call s:UloClient()
