" Vim filetype plugin for spreadsheet manipulation
" File: ftplugin/spreadsheet.vim
" Last Change: 2019 Oct 18
" Maintainer: Léo Sumi

if exists("b:spreadsheet_loaded") && b:spreadsheet_loaded == 1
    finish
endif
let b:spreadsheet_loaded = 1

setlocal noexpandtab

function s:Num2col(number)
	let A = 65

	let column = ""
	while a:number
		let mod  = (a:number - 1) % 26
		column += nr2char(mod + A)
		a:number = (a:number - 1) / 26
	endwhile
	return  join(reverse(split(column, "\zs")))
endfunction

function s:Cell()
	let row = line(.)

	let current_line = strpart(getline("."), 0, col("."))
	let previous_cells = split(current_line, "\t")
	let tab_count = len(previous_cells)

	let column = s:Num2col(tab_count)

	return {"column" : column, "row" : row}
endfunction

function Cell()
	echo join([s:Cell()["column"], s:Cell()["row"]])
endfunction

function s:Row(cell)
	return a:cell["row"]
endfunction

function s:Column(cell)
	return a:cell["column"]
endfunction
