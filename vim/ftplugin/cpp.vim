nnoremap <silent> <f8> :update<CR> :!make<CR>
nnoremap <silent> <f7> :!./executable<CR>
set tabstop=4
"set automatically update of the tag list
autocmd BufWritePost *.cpp :TlistUpdate
autocmd BufWritePost *.cu :TlistUpdate

"au BufNewFile,BufRead :!source ~/.bash_profile

"nnoremap <silent> <f10> :TlistToggle<CR>

set tabstop=4
set shiftwidth=4
set expandtab

"call DoWordComplete()
call IMAP('INT', "size_t","cpp")
call IMAP('??', "/* <++> */","cpp")
call IMAP('TAG', "/************ <++> ************/","cpp")

"add the autoformater for c --Wed May 13 12:42:36 HKT 2015
nnoremap <silent> <F5> :%!astyle --style=linux<CR>
