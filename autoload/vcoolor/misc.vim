" Miscellaneous functions.

" Creation     : 2015-04-04
" Modification : 2015-04-04
" Maintainer   : Kabbaj Amine <amine.kabb@gmail.com>
" License      : This file is placed in the public domain.

function vcoolor#misc#GetMinVal(list) " {{{1
	" Return the minimum value of a list.

	let l:min = a:list[0]
	if l:min > a:list[1]
		let l:min = a:list[1]
	endif
	if l:min > a:list[2]
		let l:min = a:list[2]
	endif

	return l:min

endfunction
function vcoolor#misc#GetMaxVal(list) " {{{1
	" Return the maximum value of a list.

	let l:max = a:list[0]
	if l:max < a:list[1]
		let l:max = a:list[1]
	endif
	if l:max < a:list[2]
		let l:max = a:list[2]
	endif

	return l:max

endfunction
" }}}
fun! vsl#general#lib#GetOsName() " {{{1
	" Return used OS name.

	if has('win32')
		let l:os = 'win'
	elseif has('unix')
		let l:os = 'unix'
	endif
	return l:os
endfunction
fun! vsl#general#lib#GetVisualSelection() " {{{1
	" Return the visual selection.

	let l:selection=getline("'<")
	let l:cursorPos=getpos("'<'")
	let [line1,col1] = getpos("'<")[1:2]
	let [line2,col2] = getpos("'>")[1:2]
	call setpos('.', l:cursorPos)

	return l:selection[col1 - 1: col2 - 1]

endfun
fun! vsl#general#lib#ShowMessage(messageTypeNumber, messageContent) " {{{1
	" Show a message according to his highlighting type.
	"	1- White (Normal).
	"	2- Red (Warning).
	"	3- Background in red (Error).
	"	4- Blue (Directory).

	if (a:messageTypeNumber == 1)
		let l:messageType = "Normal"
	elseif (a:messageTypeNumber == 2)
		let l:messageType = "WarningMsg"
	elseif (a:messageTypeNumber == 3)
		let l:messageType = "ErrorMsg"
	elseif (a:messageTypeNumber == 4)
		let l:messageType = "Directory"
	endif

	execute "echohl ".l:messageType
	echo a:messageContent
	echohl None

endfun
fun! vsl#general#lib#DefineVariable(variable, value) " {{{1
	" Set value to a:variable if she doesn't exist.

	if !exists(a:variable)
		let {a:variable} = a:value
	endif
endfun
fun! vsl#general#lib#OpenTerm(...) " {{{1
	" Open terminal in dir passed in argument or pwd by default.

	let l:dir = (a:0 ==# 0) || (a:1 ==# '') ? '"' . getcwd() . '"' : '"' . a:1 . '"'
	let l:os = vsl#general#lib#GetOsName()
	let l:termCmd = {
				\ 'unix':
					\{
						\ 'h': 'exo-open --launch TerminalEmulator ',
						\ 'b': '--working-directory ',
						\ 't': ' &'
					\},
				\ 'win':
					\{
					\ 'h': 'start cmd /k ',
						\ 'b': 'cd ',
						\ 't': ''
					\}
			\}

	exec 'silent :!' . l:termCmd[l:os].h . l:termCmd[l:os].b . l:dir . l:termCmd[l:os].t
endfun
fun! vsl#general#lib#OpenFM(...) " {{{1
	" Open default file manager in dir passed in argument or pwd by default.

	let l:dir = (a:0 ==# 0) || (a:1 ==# '') ? '"' . getcwd() . '"' : '"' . a:1 . '"'
	let l:os = vsl#general#lib#GetOsName()
	let l:fmCmd = {
				\ 'unix': {
					\ 'h': 'xdg-open ',
					\ 't': ' &'
				\},
				\ 'win': {
					\ 'h': 'start explorer ',
					\ 't': ''
				\}
			\}

	exec 'silent :!' . l:fmCmd[l:os].h . l:dir . l:fmCmd[l:os].t
endfun
" }}}

" vim:ft=vim:fdm=marker:fmr={{{,}}}:
