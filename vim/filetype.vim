" File type alias

if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.xaml setfiletype xml
augroup END
