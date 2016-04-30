vim-emoji
=========

Emoji in Vim.

Extracted from
[vim-github-dashboard](https://github.com/junegunn/vim-github-dashboard).

![](https://raw.github.com/junegunn/i/master/emoji-sign.png)

Installation
------------

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'junegunn/vim-emoji'
```

List of functions
-----------------

- `emoji#for(name[, default = '', pad = 1])`
  - Refer to [Emoji cheat sheet](http://www.emoji-cheat-sheet.com)
- `emoji#list()`
- `emoji#complete(findstart, base)`

Examples
--------

### Using Emojis as [Git Gutter](https://github.com/airblade/vim-gitgutter) symbols

```vim
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')
```

### Append Emoji list to current buffer

```vim
for e in emoji#list()
  call append(line('$'), printf('%s (%s)', emoji#for(e), e))
endfor
```

### Emoji completion

```vim
set completefunc=emoji#complete
```

![](https://raw.github.com/junegunn/i/master/emoji-complete.gif)

### Replace `:emoji_name:` into Emojis

```vim
%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g
```

