function! s:Cm()
  cd ~/dev/central-market/cm-react-service
endfunction

function! s:CmRunWordpress()
  call RunInTerminal('wordpress-server', "cd ~/dev/central-market/cm-local-dev-environment && dcu")
endfunction

function! s:CmRunServer()
  call RunInTerminal('react-service-server', "dcu")
  call s:CmRunWordpress()
endfunction

function! s:CmRunClient()
  call RunInTerminal('react-service-local', 'yarn start')
endfunction

function! s:CmRunSite()
  call s:CmRunServer()
  call s:CmRunClient()
  call s:CmRunWordpress()
endfunction

command! Cm call s:Cm()
command! CmRunSite call s:CmRunSite()
command! CmRunWordpress call s:CmRunWordpress()
command! CmRunServer call s:CmRunServer()
command! CmRunClient call s:CmRunClient()
command! CmTest call RunInTerminal('jest-tests', 'yarn jest:watch')
