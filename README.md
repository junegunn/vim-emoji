vim-emoji
=========

Emoji in Vim. Emojis are only available on terminal Vim on Mac.

Extracted from
[vim-github-dashboard](https://github.com/junegunn/vim-github-dashboard).

![](https://raw.github.com/junegunn/i/master/emoji-sign.png)

Installation
------------

[Use](https://github.com/tpope/vim-pathogen)
[your](https://github.com/gmarik/vundle)
[favorite](https://github.com/junegunn/vim-plug)
[plugin](https://github.com/Shougo/neobundle.vim)
[manager](https://github.com/MarcWeber/vim-addon-manager).

- [Pathogen](https://github.com/tpope/vim-pathogen)
  - `git clone https://github.com/junegunn/vim-emoji.git ~/.vim/bundle/vim-emoji`
- [Vundle](https://github.com/gmarik/vundle)
  1. Add `Bundle 'junegunn/vim-emoji'` to .vimrc
  2. Run `:BundleInstall`
- [NeoBundle](https://github.com/Shougo/neobundle.vim)
  1. Add `NeoBundle 'junegunn/vim-emoji'` to .vimrc
  2. Run `:NeoBundleInstall`
- [vim-plug](https://github.com/junegunn/vim-plug)
  1. Add `Plug 'junegunn/vim-emoji'` to .vimrc
  2. Run `:PlugInstall`

List of functions
-----------------

- `emoji#available()`
- `emoji#for(name[, default = '', pad = 1])`
  - Refer to [Emoji cheat sheet](http://www.emoji-cheat-sheet.com)
- `emoji#list()`
- `emoji#complete(findstart, base)`

Examples
--------

### Using Emojis as [Git Gutter](https://github.com/airblade/vim-gitgutter) symbols

```vim
" In .vimrc
silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif
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

You can define a shortcut (such as <kbd>Leader</kbd> <kbd>e</kbd> 
<kbd>m</kbd>) to quickly replace codes by Emoji in the current line:

```vim
nmap <Leader>em :s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR>:noh<CR>
```
