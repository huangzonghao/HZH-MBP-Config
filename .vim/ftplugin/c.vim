nnoremap <silent> <f8> :update<CR> :!make<CR>
nnoremap <silent> <f7> :!./executable<CR>
set tabstop=4
"call DoWordComplete()
call IMAP('INT', "size_t","c")
call IMAP('??', "/* <++> */","c")
nmap <c+_> <esc>i<++><esc>I//<tab><esc>
