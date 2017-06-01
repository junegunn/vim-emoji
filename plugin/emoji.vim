command! EmojiConvert :silent! %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g
