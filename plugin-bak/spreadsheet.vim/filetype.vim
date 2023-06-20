" File to create new filetype
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.csv    setfiletype csv
    au! BufRead,BufNewFile *.tsv    setfiletype tsv
augroup END
