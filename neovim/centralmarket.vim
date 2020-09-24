function! s:Cm()
  cd ~/dev/central-market/cm-local-dev-environment/react-service/cm-react-service
endfunction

function! s:CmRunServer()
  call RunInTerminal('react-service-server', "docker-machine start; eval $(docker-machine env) && docker-compose up\n")
  call RunInTerminal('wordpress-server', "cd ~/dev/central-market/cm-local-dev-environment && docker-machine start; eval $(docker-machine env) && docker-compose up\n")
endfunction

command! Cm call s:Cm()
command! CmRunServer call s:CmRunServer()
command! CmRunClient call RunInTerminal('react-service-local', 'yarn start')
command! CmTest call RunInTerminal('jest-tests', 'yarn jest:watch')
