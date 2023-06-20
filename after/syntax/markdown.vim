" Vim syntax file
" Maintainer: Léo Sumi

" Comments
syntax keyword markdownTodo TODO contained
syntax match markdownComment /^%.*/ contains=markdownTodo

" Highlights
hi link markdownTodo Todo
hi link markdownComment Comment
