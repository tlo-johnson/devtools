command! CmTodo edit ~/notes/cm/todo.md

" cm.com
function! s:Cm()
  cd ~/dev/central-market/react-service
endfunction

function! s:CmRunWordpress()
  call RunInTerminal('wordpress-server', "cd ~/dev/central-market/wordpress && dcu")
endfunction

function! s:CmRunServer()
  call RunInTerminal('react-service-server', "dcu")
  call s:CmRunWordpress()
endfunction

function! s:CmRunClient()
  call RunInTerminal('react-service-local', 'yarn start')
endfunction

function! s:CmRunStorybook()
  call RunInTerminal('storybook', 'yarn storybook')
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
command! CmRunStorybook call s:CmRunStorybook()
command! CmTest call RunInTerminal('jest-tests', 'yarn jest:watch')


" Joe V's
command! Jv cd ~/dev/central-market/joe-vs
command! JvDev call RunInTerminal('dev-server', 'cd ~/dev/central-market/joe-vs && sudo yarn dev:joevs') | call RunInTerminal('redis-server', 'cd ~/dev/central-market/joe-vs && yarn dev:redis')
