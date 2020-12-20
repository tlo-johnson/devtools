let s:jobIds = { }

function! RunInTerminal(bufferName, command)
  if bufexists(a:bufferName)
    execute 'buffer ' . a:bufferName
  else
    terminal
    execute 'file ' . a:bufferName
  endif

  call chansend(b:terminal_job_id, a:command . "\n")
endfunction
