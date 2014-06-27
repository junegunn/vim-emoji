if exists("g:loaded_vim_emoji")
  finish
endif
let g:loaded_vim_emoji = 1

let s:available = !has('gui_running') &&
\ (has('mac') || has('macunix') ||
\  (executable('uname') &&
\   index(['Darwin', 'Mac'], substitute(system('uname'), '\n', '', '')) != -1))

if exists("*strwidth")
  function! s:strwidth(str)
    return strwidth(a:str)
  endfunction
else
  function! s:strwidth(str)
    return len(split(a:str, 's'))
  endfunction
endif

function! emoji#available()
  return s:available
endfunction

if !s:available
  function! emoji#list()
    return []
  endfunction

  function! emoji#for(name, ...)
    return a:0 > 0 ? a:1 : ''
  endfunction
else
  function! emoji#list()
    return keys(emoji#data#dict())
  endfunction

  function! emoji#for(name, ...)
    let emoji = get(emoji#data#dict(), tolower(a:name), '')
    if empty(emoji)
      return a:0 > 0 ? a:1 : emoji
    endif

    let echar = type(emoji) == 0 ? nr2char(emoji) :
          \ join(map(copy(emoji), 'nr2char(v:val)'), '')
    if a:0 < 2 || a:2
      return echar . repeat(' ', 2 - s:strwidth(echar))
    else
      return echar
    endif
  endfunction
endif

function! emoji#complete(findstart, base)
  if !exists('s:emojis')
    let s:emojis = map(sort(keys(emoji#data#dict())),
          \ emoji#available() ?
          \ '{ "word": ":".v:val.":", "kind": emoji#for(v:val) }' :
          \ '{ "word": ":".v:val.":" }')
  endif

  if a:findstart
    let prefix = match(getline('.')[0:col('.') - 1], ':[^:]\{-}$')
    return prefix
  elseif empty(a:base)
    return []
  else
    let matches = []
    for emoji in s:emojis
      if stridx(emoji.word, a:base) >= 0
        call add(matches, emoji)
      endif
    endfor
    return matches
  endif
endfunction

