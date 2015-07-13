autocmd BufWritePost *.cpp :TlistUpdate
autocmd BufWritePost *.cu :TlistUpdate

nnoremap <silent> <f8> :update<CR> :!make<CR>
nnoremap <silent> <f7> :!./executable<CR>
"add the autoformater for c --Wed May 13 12:42:36 HKT 2015
nnoremap <silent> <F5> :%!astyle --style=linux<CR>

call IMAP('INT', "size_t","")
call IMAP('TAG', "/************ <++> ************/","")
"shortcut for true color
call IMAP('TCR', '\e[38;5;<++>m<++>',"")
"shortcut for the background color
call IMAP('BCR', '\e[48;5;<++>m<++>',"")
"shortcut for the ancii color
call IMAP('ACR', '\e[<++>m<++>',"")


