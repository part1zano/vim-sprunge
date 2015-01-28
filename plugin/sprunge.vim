" ============================================================================
" File:        sprunge.vim
" Description: vim global plugin to paste to http://sprunge.us/
" Maintainer:  Javier Lopez <m@javier.io>
" License:     WTFPL -- look it up.
" Notes:       Much of this code was thiefed from gundo.vim
" ============================================================================

" Init {{{1
if exists('g:loaded_sprunge') || &cp
  finish
endif
let g:loaded_sprunge = 1

if v:version < '700'
  echoerr "Sprunge unavailable: requires Vim 7.0+"
  finish
endif

if !executable('curl')
  echoerr "Sprunge: requires 'curl'"
  finish
endif

" Default configuration {{{1
if exists('g:sprunge_clipboard')
  let g:sprunge_clipboard = g:sprunge_clipboard =~? 'none\|vim\|external\|all' ? tolower(g:sprunge_clipboard) : 'all'
else
  let g:sprunge_clipboard = 'all'
endif

if !exists('g:sprunge_open_browser') | let g:sprunge_open_browser = 0 | endif
if !exists('g:sprunge_map') | let g:sprunge_map = '<Leader>s' | endif

" Commands & Mappings {{{1
command! -nargs=0 -range=% Sprunge call sprunge#Post(<line1>,<line2>)

if !hasmapto('<Plug>Sprunge')
    exe "nmap <unique> "  . g:sprunge_map . " <Plug>Sprunge"
    exe "xmap <unique> " . g:sprunge_map . " <Plug>Sprunge"
endif

nnoremap <unique> <script> <Plug>Sprunge :Sprunge<CR>
xnoremap <unique> <script> <Plug>Sprunge :Sprunge<CR>
