setlocal textwidth=80

" compatible with overleaf
setlocal ts=4
setlocal sw=4
setlocal wrap

setlocal spell
let g:tex_flavor='latex'

setlocal grepprg=grep\ -nH\ $*

" map the slash keys as mentioned in the update note --Sat Jul 25 01:32:14 2015
" inoremap <buffer> / \
" inoremap <buffer> \ /

nnoremap <buffer> <CR> o<CR>
nnoremap <buffer> <Space><CR> O<Esc>jo<Esc>k$

" a function to toggle the draft mode --Thu Dec 13 20:27:52 EST 2018
if !exists('*Tex_ToggleDraft')
function! Tex_ToggleDraft()
    " first save the current cursor position and the search register
    let _s=@/
    let win_view = winsaveview()
    if (match(getline(1), "draft") == -1)
        execute ':1s/class\[/class\[draft, /'
        execute 'silent! 1s/, ]/]/'
        echo 'Daft mode on'
    else
        execute ':1s/draft\(, \)\?/'
        echo 'Daft mode off'
    endif
    " now go back to the previous cursor position and restore the search reg
    let @/=_s
    call winrestview(win_view)
endfunction
endif

nnoremap <buffer> <silent> <Space>td :call Tex_ToggleDraft()<CR>

" Let vim wrap the lines automatically --Fri Feb 16 10:45:42 EST 2018
" set fo+=a
