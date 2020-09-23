function! RunInTerminal(bufferName, command)
  if bufexists(a:bufferName)
    execute 'buffer ' . a:bufferName
    return
  endif

  terminal
  execute 'file ' . a:bufferName
  call jobsend(b:terminal_job_id, a:command . "\n")
endfunction
