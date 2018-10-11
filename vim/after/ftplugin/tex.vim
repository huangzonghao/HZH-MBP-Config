setlocal textwidth=80
setlocal spell
let g:tex_flavor='latex'

setlocal grepprg=grep\ -nH\ $*

" map the slash keys as mentioned in the update note --Sat Jul 25 01:32:14 2015
inoremap <buffer> / \
inoremap <buffer> \ /

nnoremap <buffer> <CR> o<CR>
nnoremap <buffer> <Space><CR> O<Esc>jo<Esc>k$

" Let vim wrap the lines automatically --Fri Feb 16 10:45:42 EST 2018
" set fo+=a
