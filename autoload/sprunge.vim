" ============================================================================
" File:        sprunge.vim
" Description: vim global plugin to paste to http://sprunge.us/
" Maintainer:  Javier Lopez <m@javier.io>
" License:     WTFPL -- look it up.
" Notes:       Much of this code was thiefed from gundo.vim
" ============================================================================

let s:sprunge_cmd = 'curl -s -F "paste=<-" http://paste.bein.link'

function! sprunge#CopyToClipboard(clip) "{{{
  if g:sprunge_clipboard == 'vim' || g:sprunge_clipboard == 'all'
    call setreg('"', a:clip)
  endif
  if g:sprunge_clipboard == 'external' || g:sprunge_clipboard == 'all'
    if executable('xclip')
      call system('printf "' .  a:clip . '"' . ' | ' .
            \ 'xclip -selection clipboard; xclip -o -selection clipboard')
    elseif executable ('pbcopy')
      call system('printf "' .  a:clip . '"' . ' | ' .
            \ 'pbcopy')
    endif
    if has("win32") || has("win16")
      call setreg('*', a:clip)
    endif
  endif
endfunction

function! sprunge#OpenBrowser(url) "{{{1
  if has("win32")
    exe "!start cmd /cstart /b ".a:url.""
  elseif $DISPLAY !~ '^\w'
    exe "silent !sensible-browser \"".a:url."\""
  else
    exe "silent !sensible-browser -T \"".a:url."\""
  endif
  redraw!
endfunction

function! sprunge#Post(line1, line2)  "{{{
  let buffer = join(getline(a:line1, a:line2), "\n") . "\n"
  redraw | echon 'Posting to sprunge ... '
  let l:url = system(s:sprunge_cmd, buffer)[0:-2]
  if empty(l:url)
      let l:url = system("curl -s http://google.com")
      if empty(l:url)
          redraw | echohl WarningMsg|echomsg 'Error: no network available' |echohl None
      else
          redraw | echohl WarningMsg|echomsg 'Error: sprunge.us has been shutdown or altered its api' |echohl None
      endif
  else
      call sprunge#CopyToClipboard(l:url)
      if g:sprunge_open_browser | call sprunge#OpenBrowser(l:url . '?' . &filetype) | endif
      redraw | echomsg 'Done: ' . l:url
  endif
endfunction
