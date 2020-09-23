function! s:Cm()
  cd '~/dev/central-market/cm-local-dev-environment/react-service/cm-react-service'
endfunction

function! s:CmInitServer()
  call s:RunInTerminal('react-service-server', "cd ~/dev/central-market/cm-local-dev-environment/react-service/cm-react-service && docker-machine start; eval $(docker-machine env) && docker-compose up\n")
  call s:RunInTerminal('wordpress-server', "cd ~/dev/central-market/cm-local-dev-environment && docker-machine start; eval $(docker-machine env) && docker-compose up\n")
endfunction

command! Cm call s:Cm()
command! CmInitServer call s:CmInitServer()
command! CmInitClient call RunInTerminal('react-service-local', 'yarn start')
