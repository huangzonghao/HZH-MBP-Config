" This file will be loaded each time there is a refresh of netrw window. So an
"   error would be thrown if the unmapping has already been done. And for some
"   reason nunmap <silent> <buffer> doesn't work

" disable t so that tab switching can work properly
silent! nunmap <buffer> t
silent! nunmap <buffer> Tb
silent! nunmap <buffer> Th

nmap <buffer> u <Plug>NetrwBrowseUpDir
silent! nunmap <buffer> -
silent! nunmap <buffer> <C-L>
nmap <buffer> r <Plug>NetrwRefresh

" nmap <buffer> T :call <SNR>97_NetrwSplit(4)<CR>
" if !empty(maparg('Th', 'n'))
    " unmap <buffer> Th
" endif
" if !empty(maparg('Tb', 'n'))
    " unmap <buffer> Tb
" endif
" nnoremap <buffer> t. gt
" nnoremap <buffer> t, gT
" nnoremap <buffer> t< :tabm -1<CR>
" nnoremap <buffer> t> :tabm +1<CR>
" nnoremap <buffer> tt :tabnew<Space>
" nnoremap <buffer> tn :tabedit %<CR>
" nnoremap <buffer> tc :tabclose<CR>
" nnoremap <buffer> te :enew<CR>

" nmap <buffer> u <Plug>VinegarUp
" nmap <buffer> - <Plug>(easymotion-bd-jk)
