inoremap <buffer> <F6> <esc>:up<cr><cr>:!open %:p<cr><cr>
nnoremap <buffer> <F6> :up<cr><cr>:!open %:p<cr><cr>

" general html folds:
" 1) head, body
" 2) div[wrapper]
" 3) section
" 4) ul
setlocal foldlevel=4
setlocal foldmethod=indent
setlocal spell
