vim-emoji
=========

Named Emoji in Vim. Emojis are only available on terminal Vim on Mac.

Extracted from
[vim-github-dashboard](https://github.com/junegunn/vim-github-dashboard).

![](https://raw.github.com/junegunn/vim-emoji/png/emoji-sign.png)

Installation
------------

[Use](https://github.com/tpope/vim-pathogen)
[your](https://github.com/gmarik/vundle)
[favorite](https://github.com/junegunn/vim-plug)
[plugin](https://github.com/Shougo/neobundle.vim)
[manager](https://github.com/MarcWeber/vim-addon-manager).

- [Vundle](https://github.com/gmarik/vundle)
  - `Bundle 'junegunn/vim-emoji'`
- [NeoBundle](https://github.com/Shougo/neobundle.vim)
  - `NeoBundle 'junegunn/vim-emoji'`
- [vim-plug](https://github.com/junegunn/vim-plug)
  - `Plug 'junegunn/vim-emoji'`

List of functions
-----------------

- emoji#available()
- emoji#for(name[, pad = 1])
  - Refer to [Emoji cheat sheet](http://www.emoji-cheat-sheet.com)
  - Returns an empty string if not available
- emoji#list()

