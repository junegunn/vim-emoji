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

- [Pathogen](https://github.com/tpope/vim-pathogen)
  - `git clone https://github.com/junegunn/vim-emoji.git ~/.vim/bundle/vim-emoji`
- [Vundle](https://github.com/gmarik/vundle)
  1. Add `Bundle 'junegunn/vim-emoji'` to .vimrc
  2. `:BundleInstall`
- [NeoBundle](https://github.com/Shougo/neobundle.vim)
  1. Add `NeoBundle 'junegunn/vim-emoji'` to .vimrc
  2. `:NeoBundleInstall`
- [vim-plug](https://github.com/junegunn/vim-plug)
  1. Add `Plug 'junegunn/vim-emoji'` to .vimrc
  2. `:PlugInstall`

List of functions
-----------------

- `emoji#available()`
- `emoji#for(name[, pad = 1])`
  - Refer to [Emoji cheat sheet](http://www.emoji-cheat-sheet.com)
  - Returns an empty string if not available
- `emoji#list()`

