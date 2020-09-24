function! s:GitBlame(...)
  if a:0 == 0
    let startLine = getcurpos()[1]
    let endLine = getcurpos()[1]
  endif

  if a:0 == 1
    let startLine = a:1
    let endLine = a:1
  endif

  if a:0 == 2
    let startLine = a:1
    let endLine = a:2
  endif

  execute '! git blame -L ' . startLine . ',' . endLine . ' %'
endfunction

command! -nargs=* GitBlame call s:GitBlame(<args>)
