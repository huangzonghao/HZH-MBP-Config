" Folder in which script resides: (not safe for symlinks)
let s:path = expand('<sfile>:p:h')
exe "source".expand('<sfile>:p:h')."/c.vim"
