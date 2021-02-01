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
