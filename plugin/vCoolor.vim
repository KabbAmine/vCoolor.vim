" Simple color selector/picker plugin.
" Version: 1.2.3

" Creation     : 2014-07-26
" Modification : 2016-08-09
" Maintainer   : Kabbaj Amine <amine.kabb@gmail.com>
" License      : This file is placed in the public domain.


" Vim options {{{1
if exists("g:vcoolor_loaded")
    finish
endif
let g:vcoolor_loaded = 1

" To avoid conflict problems.
let s:saveCpoptions = &cpoptions
set cpoptions&vim
" }}}


" COMMANDS
" =====================================================================

" Main commands {{{1
command! VCoolor call s:VCoolor()
command! -nargs=1 VCoolIns call s:VCoolIns(<f-args>)
command! VCase call s:SetCase()
" }}}
" For debug purpose. {{{1
" if exists(":GetColor") != 2
"     command! GetColor :echo s:GetCurrCol()
" endif
" }}}
" Conversion commands. {{{1
let s:commandNames = [
			\ "Rgb2Hex", "Rgb2RgbPerc", "Rgb2Hsl",
			\ "RgbPerc2Hex", "RgbPerc2Rgb",
			\ "Hex2Lit", "Hex2Rgb", "Hex2RgbPerc", "Hex2Hsl",
			\ "Hsl2Rgb", "Hsl2Hex"
			\ ]
for s:cn in s:commandNames
    if exists(":".s:cn."") != 2
        execute "command! -nargs=1 ".s:cn." :echo vcoolor#convert#".s:cn."(<args>)"
    endif
endfor
" }}}

" MAPPINGS
" =====================================================================

" {{{1
let s:vcoolorMap    = exists('g:vcoolor_map') ? g:vcoolor_map : '<A-c>'
let s:vcoolInsRMap  = exists('g:vcool_ins_rgb_map') ? g:vcool_ins_rgb_map : '<A-r>'
let s:vcoolInsHMap  = exists('g:vcool_ins_hsl_map') ? g:vcool_ins_hsl_map : '<A-v>'
let s:vcoolInsRaMap = exists('g:vcool_ins_rgba_map') ? g:vcool_ins_rgba_map : '<A-w>'

if !exists('g:vcoolor_disable_mappings') || exists('g:vcoolor_map')
	execute "nmap <silent> ".s:vcoolorMap." :VCoolor<CR>"
	execute "imap <silent> ".s:vcoolorMap." <Esc>:VCoolor<CR>a"
endif

if !exists('g:vcoolor_disable_mappings') || exists('g:vcool_ins_rgb_map')
	execute "nmap <silent> ".s:vcoolInsRMap." :VCoolIns r<CR>"
	execute "imap <silent> ".s:vcoolInsRMap." <Esc>:VCoolIns r<CR>a"
endif

if !exists('g:vcoolor_disable_mappings') || exists('g:vcool_ins_hsl_map')
	execute "nmap <silent> ".s:vcoolInsHMap." :silent VCoolIns h<CR>"
	execute "imap <silent> ".s:vcoolInsHMap." <Esc>:VCoolIns h<CR>a"
endif

if !exists('g:vcoolor_disable_mappings') || exists('g:vcool_ins_rgba_map')
	execute "nmap <silent> ".s:vcoolInsRaMap." :silent VCoolIns ra<CR>"
	execute "imap <silent> ".s:vcoolInsRaMap." <Esc>:VCoolIns ra<CR>a"
endif
" }}}

" VARIABLES
" =====================================================================

" Set new color in lowercase if the global variable is set to 1. " {{{1
if !exists("g:vcoolor_lowercase")
	let g:vcoolor_lowercase = 0
endif
" }}}
" 140 html base colors. {{{1
let s:colorNames = vcoolor#convert#HtmlBaseColName()
" }}}
" Keep track of current working directory of script {{{1
let s:path = expand('<sfile>:p:h')
" Get datas related to used OS
if has('unix')
	let s:blackHole = ' 2> /dev/null'
elseif has('win32')
	let s:blackHole = ' > NUL'
else
	let s:blackHole = ' >& /dev/null'
endif
" }}}

" FUNCTIONS
" =====================================================================

" Processing functions
" ************************
function s:GetCurrCol() " {{{1
    " Get current color and return a list:
    " [
    " currentColorName,
    " currentHexColor,
    " typeColor (l: literal, n:none, h:hex, r:rgb, rp:rgb(%), rgba:rgba, hs:hsl)
    " ]

    let l:cWord = expand("<cWORD>")
    let l:cword = expand("<cword>")
    let l:getLine = getline(".")

    let l:regexHex = '^.*\(#[a-fA-F0-9]\{3,6}\).*$'
    let l:regexRgb = '^.*\<rgb\>(\(\([ ]*[0-9]\{1,3}[ ]*,\)\{2}[ ]*[0-9]\{1,3}[ ]*\)).*$'
    let l:regexRgba = '^.*\<rgba\>(\(\([ ]*[0-9]\{1,3}[ ]*,\)\{3}\)[ ]*\([01]\{1}\.\?[0-9]\?\)).*$'
    let l:regexRgbPerc = '^.*\<rgb\>(\(\([ ]*[0-9]\{1,3}%[ ]*,\)\{2}[ ]*[0-9]\{1,3}%[ ]*\)).*$'
    let l:regexHsl = '^.*\<hsl\>(\(\([ ]*[0-9]\{1,3}%\?[ ]*,\)\{2}[ ]*[0-9]\{1,3}%[ ]*\)).*$'

    let s:currColor = ["", "", ""]
    " Nothing or special character under cursor fix.
    if match(l:cWord, '[(, ]\+') == 0
        let s:currColor = ["","","n"]
    elseif has_key(s:colorNames, tolower(l:cword))
        let s:currColor = [l:cword, s:colorNames[l:cword], "l"]
    elseif match(l:getLine, l:regexRgb) != -1
        let s:currColor[0] = substitute(l:getLine, l:regexRgb, '\1', '')
        let s:currColor[1] = vcoolor#convert#Rgb2Hex(s:currColor[0])
        let s:currColor[2] = "r"
    elseif match(l:getLine, l:regexRgba) != -1
        let s:currColor[0] = substitute(l:getLine, l:regexRgba, '\1', '')
        let s:currColor[1] = vcoolor#convert#Rgb2Hex(s:currColor[0])
        let s:currColor[2] = "rgba"
    elseif match(l:getLine, l:regexRgbPerc) != -1
        let s:currColor[0] = substitute(l:getLine, l:regexRgbPerc, '\1', '')
        let s:currColor[1] = vcoolor#convert#RgbPerc2Hex(s:currColor[0])
        let s:currColor[2] = "rp"
    elseif match(l:getLine, l:regexHsl) != -1
        let s:currColor[0] = substitute(l:getLine, l:regexHsl, '\1', '')
        let s:currColor[1] = vcoolor#convert#Hsl2Hex(s:currColor[0])
        let s:currColor[2] = "hs"
    elseif match(l:cWord, l:regexHex) != -1
        let s:currColor[0] = substitute(l:cWord, l:regexHex, '\1', '')
        let s:currColor[1] = s:currColor[0]
        let s:currColor[2] = "h"
    else
        let s:currColor = ["","","n"]
    endif

    let s:currColor[1] = toupper(s:currColor[1])

    return s:currColor

endfunction
function s:SetColorByType(oldColor, newCol) " {{{1
    " Set the correct color depending of the old color
    " type (hex, rgb, literal, none ...).

    let l:oldCol = a:oldColor[0]
    let l:newCol = strpart(a:newCol, 0, 7) " To remove the ******* annoying ^@.

    if a:oldColor[2] == 'r'
        let l:newCol = vcoolor#convert#Hex2Rgb(l:newCol)
        execute "silent: s/".l:oldCol."/".l:newCol
	elseif a:oldColor[2] == 'rgba'
        let l:newCol = vcoolor#convert#Hex2Rgb(l:newCol)
        execute "silent: s/".l:oldCol."/".l:newCol.","
    elseif a:oldColor[2] == 'rp'
        let l:newCol = vcoolor#convert#Hex2RgbPerc(l:newCol)
        execute "silent: s/".l:oldCol."/".l:newCol
    elseif a:oldColor[2] == 'hs'
        let l:newCol = vcoolor#convert#Hex2Hsl(l:newCol)
        execute "silent: s/".l:oldCol."/".l:newCol
    elseif a:oldColor[2] == 'l'
        let l:newCol = vcoolor#convert#Hex2Lit(l:newCol)
        execute "silent: s/".l:oldCol."/".l:newCol
    elseif a:oldColor[2] == 'n'
        if expand("<cword>") == '#'
            :normal x
        endif
        execute ":normal a".l:newCol
        let s:position = getpos(".")
    else
        let l:newCol = strpart(l:newCol, 0, 7)
        execute "silent: .s/".l:oldCol."/".l:newCol
    endif

endfunction
function s:ExecPicker(hexColor) " {{{1
	" Execute the appropriate command for the color picker and
	" return the new hexadecimal color.
	
	if exists('g:vcoolor_custom_picker') && !empty(g:vcoolor_custom_picker)
		let l:comm = g:vcoolor_custom_picker . '"' . a:hexColor . '"' . s:blackHole
	else
		if has('win32')
			let l:comm = s:path . '/../pickers/win32/cpicker.exe ' . a:hexColor . s:blackHole
		elseif has('mac')
			let l:comm = s:path . '/../pickers/osx/color-picker "' . a:hexColor . '"' . s:blackHole
		elseif has('unix')
			if (executable('yad'))
				let l:comm = 'yad --title="vCoolor" --color --on-top --skip-taskbar --center --init-color="' . a:hexColor . '"' . s:blackHole
			elseif (executable('zenity'))
				let l:comm = 'zenity --title="vCoolor" --color-selection --color="' . a:hexColor . '"' . s:blackHole
			else
				echohl ErrorMsg
				echomsg 'No yad or zenity installed'
				echohl None
				return
			en
		endif
	endif
	let s:newCol = system(l:comm)
	if tolower(s:newCol)[0:3] == 'rgb('
		let s:newCol = vcoolor#convert#Rgb2Hex(s:newCol[4:strlen(s:newCol)-3])
	elseif strlen(s:newCol) >= 13
		let s:newCol = s:newCol[0:2].s:newCol[5:6].s:newCol[9:10]
	endif
	let s:newCol = g:vcoolor_lowercase == 1 ? tolower(s:newCol) : toupper(s:newCol)

    return s:newCol

endfunction
function s:SetCase() " {{{1
	" Set returned hex color case.

	if g:vcoolor_lowercase == 0
		let g:vcoolor_lowercase = 1
		echo "Hex color in lowercase"
	else
		let g:vcoolor_lowercase = 0
		echo "Hex color in uppercase"
	endif
endfunction
" }}}

" Main functions
" ************************
function s:VCoolor() " {{{1

    let s:position = getpos(".")

    let l:oldCol = s:GetCurrCol()
    let l:newCol = s:ExecPicker(l:oldCol[1])

    if !empty(l:oldCol) && !empty(l:newCol)
        call s:SetColorByType(l:oldCol, l:newCol)
    endif

    call setpos(".", s:position)

endfunction
function s:VCoolIns(type) " {{{1
	" Insert color of type:
	" - r: rgb mode.
	" - h: hsl mode.
	" - ra: rgba mode.

	let l:newCol = s:ExecPicker("")
	if !empty(l:newCol)
		if a:type == 'r'
			execute ":normal argb(".vcoolor#convert#Hex2Rgb(l:newCol).")"
		elseif a:type == 'h'
			execute ":normal ahsl(".vcoolor#convert#Hex2Hsl(l:newCol).")"
		elseif a:type == 'ra'
			execute ":normal argba(".vcoolor#convert#Hex2Rgb(l:newCol).", 1)"
		endif
	endif

endfunction
" }}}


" Restore default vim options {{{1
let &cpoptions = s:saveCpoptions
unlet s:saveCpoptions
" }}}

" vim:ft=vim:fdm=marker:fmr={{{,}}}:
