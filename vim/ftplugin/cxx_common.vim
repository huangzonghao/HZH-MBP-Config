" Search tags file in the project folder
set tags=./tags;,tags
nnoremap <silent> <f8> :update<CR> :!make<CR>
nnoremap <silent> <f7> :!./executable<CR>
" add the autoformater for c --Wed May 13 12:42:36 HKT 2015
" shall be carefully tuned before use, the configuration is not satisfied now
nnoremap <silent> <F5> :%!astyle --style=linux<CR>
" vim natural indention settings
set cinoptions=g0.5s,h0.5s,t0

"the following functions are provided by a.vim
"go to the partner file
nnoremap gp :A<CR>
"show the partner file in v-split mode
nnoremap gP :AV<CR>

let g:C_Insert_Mode_Leader = '/'

call IMAP('INT', "size_t","")
call IMAP('--', "->","")
call IMAP(',,', "<< \"<++>\"<++>","")
"shortcut for true color
call IMAP('TCR', '\e[38;5;<++>m<++>',"")
"shortcut for the background color
call IMAP('BCR', '\e[48;5;<++>m<++>',"")
"shortcut for the ancii color
call IMAP('ACR', '\e[<++>m<++>',"")

" a function to automatically update the modified time stamp in cxx files
" -- 2015.7.26
function! C_UpdateModifiedTimeStamp()
   " first save the current cursor position and the search register
    let _s=@/
    let l = line(".")
    let c = col(".")

    " then go to the top of the file and search the keyword
    normal! gg
    silent! exe "normal /Modified/\<CR>"
    " make sure the searching result is in the valid region
    if line('.') > 1 && line('.') < 15
        normal! wwD
        call C_InsertDateAndTime('d')
    endif
    " now go back to the previous cursor position and restore the search reg
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre *.{c,,cc,cpp,h,cu,cuda,cuh} call C_UpdateModifiedTimeStamp()
