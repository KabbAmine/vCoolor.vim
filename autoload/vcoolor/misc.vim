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

" vim:ft=vim:fdm=marker:fmr={{{,}}}:
