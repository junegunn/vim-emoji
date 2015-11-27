" Copyright (c) 2015 Junegunn Choi
"
" MIT License
"
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
"
" The above copyright notice and this permission notice shall be
" included in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
" NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
" LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
" OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
" WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

if exists("g:loaded_vim_emoji")
  finish
endif
let g:loaded_vim_emoji = 1

let s:available = has('mac') || has('macunix') ||
      \ (executable('uname') &&
      \  index(['Darwin', 'Mac'], substitute(system('uname'), '\n', '', '')) != -1)

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
    let pad = get(a:, 2, 1)
    if pad
      return echar . repeat(' ', 1 + pad - s:strwidth(echar))
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
    return match(getline('.')[0:col('.') - 1], ':[^: \t]*$')
  elseif empty(a:base)
    return s:emojis
  else
    augroup emoji_complete_redraw
      autocmd!
      autocmd CursorMoved,CursorMovedI,InsertLeave * redraw!
            \| augroup emoji_complete_redraw
            \|   execute 'autocmd!'
            \| augroup END
            \| augroup! emoji_complete_redraw
    augroup END
    return filter(copy(s:emojis), 'stridx(v:val.word, a:base) >= 0')
  endif
endfunction

