" Search tags file in the project folder
" set tags=./tags;,tags
nnoremap <buffer>  <silent> <f8> :update<CR> :!make<CR>
nnoremap <buffer>  <silent> <f7> :!./executable<CR>
" add the autoformater for c --Wed May 13 12:42:36 HKT 2015
" shall be carefully tuned before use, the configuration is not satisfied now
nnoremap <buffer>  <silent> <F5> :%!astyle --style=linux<CR>
" vim natural indention settings
set cinoptions=g0.5s,h0.5s,t0

"the following functions are provided by a.vim
"go to the partner file
nnoremap <buffer>  gp :A<CR>
"show the partner file in v-split mode
nnoremap <buffer>  gP :AV<CR>

let g:C_Insert_Mode_Leader = '/'

" a function to automatically update the modified time stamp in cxx files
" -- 2015.7.26
if !exists('*C_UpdateModifiedTimeStamp')
    function! C_UpdateModifiedTimeStamp()
    " first save the current cursor position and the search register
        let _s=@/
        let win_view = winsaveview()
        " Search for the time stamp between line 1 and line 15
        silent! /\%>1l\%<15lModified:\s\{2}\w\{3}\s\w\{3}.*$
        " Make sure the cursor has really been moved, which indicates a hit
        if line('.') < 15
            s/\(Modified:\s\{2}\).*$/\1/g
            normal! $
            call C_InsertDateAndTime('d')
            call winrestview(win_view)
        endif
        " now go back to the previous cursor position and restore the search reg
        let @/=_s
    endfunction
    " autocmd BufWritePre *.{c,,cc,cpp,h,cu,cuda,cuh} call C_UpdateModifiedTimeStamp()
endif

nnoremap <buffer> <silent> <Space>mt :call C_UpdateModifiedTimeStamp()<CR>
nnoremap <buffer> <Space>. .
nnoremap <buffer> . <ESC>
