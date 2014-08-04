" Simple color selector/picker plugin.
" Version: 0.2

" Creation     : 2014-07-26
" Modification : 2014-08-04
" Maintainer   : Kabbaj Amine <amine.kabb@gmail.com>
" License      : This file is placed in the public domain.


if exists("g:loadedVCoolor")
    finish
endif
let g:loadedVCoolor = 1

" To avoid conflict problems.
let s:saveCpoptions = &cpoptions
set cpoptions&vim

" COMMANDS
" =====================================================================

" For debug purpose {
if exists(":GetColor") != 2
    command! GetColor :echo s:GetCurrCol()
endif

" Conversion commands.
let s:commandNames = ["Rgb2Hex", "Rgb2RgbPerc", "RgbPerc2Hex", "RgbPerc2Rgb", "Hex2Lit", "Hex2Rgb", "Hex2RgbPerc"]
for cn in s:commandNames
    if exists(":".cn."") != 2
        execute "command! -nargs=1 ".cn." :echo s:".cn."(<args>)"
    endif
endfor
" }

" MAPPINGS
" =====================================================================

" {
if has('unix') && executable("yad")
    if !hasmapto('<Plug>vCoolor', 'n')
        nmap <unique> <A-c> <Plug>vCoolor
    endif
    nnoremap <unique> <script> <Plug>vCoolor <SID>VC
    nnoremap <silent> <SID>VC :call <SID>VCoolor()<CR>
    if !hasmapto('<Plug>vCoolorI', 'i')
        imap <unique> <A-c> <Plug>vCoolorI
    endif
    inoremap <unique> <script> <Plug>vCoolorI <SID>VCI
    inoremap <silent> <SID>VCI <Esc>:call <SID>VCoolor()<CR>a
endif
" }

" VARIABLES
" =====================================================================

" Local variables
" ************************
" 140 html base colors {
let s:colorNames = {
            \ 'aliceblue': '#F0F8FF',
            \ 'antiquewhite': '#FAEBD7',
            \ 'aqua': '#00FFFF',
            \ 'aquamarine': '#7FFFD4',
            \ 'azure': '#F0FFFF',
            \ 'beige': '#F5F5DC',
            \ 'bisque': '#FFE4C4',
            \ 'black': '#000000',
            \ 'blanchedalmond': '#FFEBCD',
            \ 'blue': '#0000FF',
            \ 'blueviolet': '#8A2BE2',
            \ 'brown': '#A52A2A',
            \ 'burlywood': '#DEB887',
            \ 'cadetblue': '#5F9EA0',
            \ 'chartreuse': '#7FFF00',
            \ 'chocolate': '#D2691E',
            \ 'coral': '#FF7F50',
            \ 'cornflowerblue': '#6495ED',
            \ 'cornsilk': '#FFF8DC',
            \ 'crimson': '#DC143C',
            \ 'cyan': '#00FFFF',
            \ 'darkblue': '#00008B',
            \ 'darkcyan': '#008B8B',
            \ 'darkgoldenrod': '#B8860B',
            \ 'darkgray': '#A9A9A9',
            \ 'darkgreen': '#006400',
            \ 'darkkhaki': '#BDB76B',
            \ 'darkmagenta': '#8B008B',
            \ 'darkolivegreen': '#556B2F',
            \ 'darkorange': '#FF8C00',
            \ 'darkorchid': '#9932CC',
            \ 'darkred': '#8B0000',
            \ 'darksalmon': '#E9967A',
            \ 'darkseagreen': '#8FBC8F',
            \ 'darkslateblue': '#483D8B',
            \ 'darkslategray': '#2F4F4F',
            \ 'darkturquoise': '#00CED1',
            \ 'darkviolet': '#9400D3',
            \ 'deeppink': '#FF1493',
            \ 'deepskyblue': '#00BFFF',
            \ 'dimgray': '#696969',
            \ 'dodgerblue': '#1E90FF',
            \ 'firebrick': '#B22222',
            \ 'floralwhite': '#FFFAF0',
            \ 'forestgreen': '#228B22',
            \ 'fuchsia': '#FF00FF',
            \ 'gainsboro': '#DCDCDC',
            \ 'ghostwhite': '#F8F8FF',
            \ 'gold': '#FFD700',
            \ 'goldenrod': '#DAA520',
            \ 'gray': '#808080',
            \ 'green': '#008000',
            \ 'greenyellow': '#ADFF2F',
            \ 'honeydew': '#F0FFF0',
            \ 'hotpink': '#FF69B4',
            \ 'indianred': '#CD5C5C',
            \ 'indigo': '#4B0082',
            \ 'ivory': '#FFFFF0',
            \ 'khaki': '#F0E68C',
            \ 'lavender': '#E6E6FA',
            \ 'lavenderblush': '#FFF0F5',
            \ 'lawngreen': '#7CFC00',
            \ 'lemonchiffon': '#FFFACD',
            \ 'lightblue': '#ADD8E6',
            \ 'lightcoral': '#F08080',
            \ 'lightcyan': '#E0FFFF',
            \ 'lightgoldenrodyellow': '#FAFAD2',
            \ 'lightgray': '#D3D3D3',
            \ 'lightgreen': '#90EE90',
            \ 'lightpink': '#FFB6C1',
            \ 'lightsalmon': '#FFA07A',
            \ 'lightseagreen': '#20B2AA',
            \ 'lightskyblue': '#87CEFA',
            \ 'lightslategray': '#778899',
            \ 'lightsteelblue': '#B0C4DE',
            \ 'lightyellow': '#FFFFE0',
            \ 'lime': '#00FF00',
            \ 'limegreen': '#32CD32',
            \ 'linen': '#FAF0E6',
            \ 'magenta': '#FF00FF',
            \ 'maroon': '#800000',
            \ 'mediumaquamarine': '#66CDAA',
            \ 'mediumblue': '#0000CD',
            \ 'mediumorchid': '#BA55D3',
            \ 'mediumpurple': '#9370DB',
            \ 'mediumseagreen': '#3CB371',
            \ 'mediumslateblue': '#7B68EE',
            \ 'mediumspringgreen': '#00FA9A',
            \ 'mediumturquoise': '#48D1CC',
            \ 'mediumvioletred': '#C71585',
            \ 'midnightblue': '#191970',
            \ 'mintcream': '#F5FFFA',
            \ 'mistyrose': '#FFE4E1',
            \ 'moccasin': '#FFE4B5',
            \ 'navajowhite': '#FFDEAD',
            \ 'navy': '#000080',
            \ 'oldlace': '#FDF5E6',
            \ 'olive': '#808000',
            \ 'olivedrab': '#6B8E23',
            \ 'orange': '#FFA500',
            \ 'orangered': '#FF4500',
            \ 'orchid': '#DA70D6',
            \ 'palegoldenrod': '#EEE8AA',
            \ 'palegreen': '#98FB98',
            \ 'paleturquoise': '#AFEEEE',
            \ 'palevioletred': '#DB7093',
            \ 'papayawhip': '#FFEFD5',
            \ 'peachpuff': '#FFDAB9',
            \ 'peru': '#CD853F',
            \ 'pink': '#FFC0CB',
            \ 'plum': '#DDA0DD',
            \ 'powderblue': '#B0E0E6',
            \ 'purple': '#800080',
            \ 'red': '#FF0000',
            \ 'rosybrown': '#BC8F8F',
            \ 'royalblue': '#4169E1',
            \ 'saddlebrown': '#8B4513',
            \ 'salmon': '#FA8072',
            \ 'sandybrown': '#F4A460',
            \ 'seagreen': '#2E8B57',
            \ 'seashell': '#FFF5EE',
            \ 'sienna': '#A0522D',
            \ 'silver': '#C0C0C0',
            \ 'skyblue': '#87CEEB',
            \ 'slateblue': '#6A5ACD',
            \ 'slategray': '#708090',
            \ 'snow': '#FFFAFA',
            \ 'springgreen': '#00FF7F',
            \ 'steelblue': '#4682B4',
            \ 'tan': '#D2B48C',
            \ 'teal': '#008080',
            \ 'thistle': '#D8BFD8',
            \ 'tomato': '#FF6347',
            \ 'turquoise': '#40E0D0',
            \ 'violet': '#EE82EE',
            \ 'wheat': '#F5DEB3',
            \ 'white': '#FFFFFF',
            \ 'whitesmoke': '#F5F5F5',
            \ 'yellow': '#FFFF00',
            \ 'yellowgreen': '#9ACD32'
            \ }
" }

" FUNCTIONS
" =====================================================================

" Processing functions
" ************************
function s:GetCurrCol()
    " Get current color and return a list:
    " [
    " currentColorName,
    " currentHexColor,
    " typeColor (l: literal, n:none, h:hex, r:rgb, rp:rgb(%))
    " ]

    let l:cWord = expand("<cWORD>")
    let l:cword = expand("<cword>")
    let l:getLine = getline(".")

    let l:regexHex = '^.*\(#[a-fA-F0-9]\{3,6}\).*$'
    let l:regexRgb = '^.*\<rgb\>(\(\([ ]*[0-9]\{1,3}[ ]*,\)\{2}[ ]*[0-9]\{1,3}[ ]*\)).*$'
    let l:regexRgbPerc = '^.*\<rgb\>(\(\([ ]*[0-9]\{1,3}%[ ]*,\)\{2}[ ]*[0-9]\{1,3}%[ ]*\)).*$'

    let s:currColor = ["","",""]
    if has_key(s:colorNames, tolower(l:cword))
        let s:currColor = [l:cword, s:colorNames[l:cword], "l"]
    elseif match(l:getLine, l:regexRgb) != -1
        let s:currColor[0] = substitute(l:getLine, l:regexRgb, '\1', '')
        let s:currColor[1] = s:Rgb2Hex(s:currColor[0])
        let s:currColor[2] = "r"
    elseif match(l:getLine, l:regexRgbPerc) != -1
        let s:currColor[0] = substitute(l:getLine, l:regexRgbPerc, '\1', '')
        let s:currColor[1] = s:RgbPerc2Hex(s:currColor[0])
        let s:currColor[2] = "rp"
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
function s:SetColorByType(oldColor, newCol)
    " Set the correct color depending of the old color
    " type (hex, rgb, literal, none ...).

    let l:oldCol = a:oldColor[0]
    let l:newCol = strpart(a:newCol, 0, 7) " To remove the ******* annoying ^@.

    if a:oldColor[2] == 'r'
        let l:newCol = s:Hex2Rgb(l:newCol)
        execute "silent: s/".l:oldCol."/".l:newCol
    elseif a:oldColor[2] == 'rp'
        let l:newCol = s:Hex2RgbPerc(l:newCol)
        execute "silent: s/".l:oldCol."/".l:newCol
    elseif a:oldColor[2] == 'l'
        let l:newCol = s:Hex2Lit(l:newCol)
        execute "silent: s/".l:oldCol."/".l:newCol
    elseif a:oldColor[2] == 'n'
        execute ":normal a".l:newCol
        let s:position = getpos(".")
    else
        let l:newCol = strpart(l:newCol, 0, 7)
        execute "silent: .s/".l:oldCol."/".l:newCol
    endif

endfunction
function s:ExecPicker(hexColor)
    " Execute the command for the color picker.

    let l:comm = "yad --title=\"vCoolor\" --color --init-color=\"".a:hexColor."\" --on-top --skip-taskbar --center"
    let s:newCol = toupper(system(l:comm))

    return s:newCol

endfunction

" Conversion functions
" ************************
function s:Rgb2Hex(rgbCol)
    " Convert from rgb to hex:
    " 255, 0, 255 => #FF00FF

    let l:rgbCol = substitute(a:rgbCol, " ", "", "g")       " Remove spaces.
    let l:rgbColL = split(l:rgbCol, ",")

    let l:color = ""
    for l:element in copy(l:rgbColL)
        let l:hexElem = ConvertToBase(l:element, 16)
        if len(l:hexElem) == 1
            let l:hexElem = "0".l:hexElem
        endif
        let l:color = l:color.l:hexElem
    endfor

    return "#".l:color

endfunction
function s:Rgb2RgbPerc(rgbCol)
    " Convert from rgb to rgb (%):
    " 255, 0, 255 => 100%, 0%, 100%

    let l:rgbCol = substitute(a:rgbCol, " ", "", "g")
    let l:rgbColL = split(l:rgbCol, ",")

    let l:color = ""
    for l:element in copy(l:rgbColL)
        let l:rgbElem= (l:element * 100) / 255
        if len(l:color) == 0
            let l:color = l:rgbElem."%"
        else
            let l:color = l:color.", ".l:rgbElem."%"
        endif
    endfor

    return color

endfunction
function s:RgbPerc2Hex(rgbPercCol)
    " Convert from rgb (%) to hex:
    " 100%, 0%, 100% => #FF00FF

    let l:rgbCol = s:RgbPerc2Rgb(a:rgbPercCol)
    let l:color = s:Rgb2Hex(l:rgbCol)

    return l:color

endfunction
function s:RgbPerc2Rgb(rgbPercCol)
    " Convert from rgb (%) to rgb:
    " 100%, 0%, 0% => 255, 0, 0

    let l:rgbPercCol = substitute(a:rgbPercCol, " ", "", "g")
    let l:rgbPercCol = substitute(a:rgbPercCol, "%", "", "g")   " Remove %.
    let l:rgbPercColL = split(l:rgbPercCol, ",")

    let l:color = ""
    for l:element in copy(l:rgbPercColL)
        let l:elementF = str2float(l:element)
        let l:rgbElem = round(l:elementF * 2.55)
        let l:rgbElem = float2nr(l:rgbElem)
        if len(l:color) == 0
            let l:color = l:rgbElem
        else
            let l:color = l:color.", ".l:rgbElem
        endif
    endfor

    return l:color

endfunction
function s:Hex2Lit(hexCol)
    " Convert from hex to literal name.
    " #FF0000 => red

    let l:colIndex = index(values(s:colorNames), a:hexCol)

    if l:colIndex != -1
        let s:color =get(keys(s:colorNames), l:colIndex)
    else
        let s:color = a:hexCol
    endif

    return s:color

endfunction
function s:Hex2Rgb(hexCol)
    " Convert from hex to rgb:
    " #FF00FF => 255, 0, 255

    let l:hexColL = matchlist(a:hexCol, '#\([0-9A-F]\{1,2}\)\([0-9A-F]\{1,2}\)\([0-9A-F]\{1,2}\)')
    " Remove 1st and empty values.
    call remove(l:hexColL, 0)
    call remove(l:hexColL, 3, -1)

    let s:color = ""
    for l:element in l:hexColL
        let l:rgbElem = ConvertFromBase(l:element, 16)
        let l:rgbElem = string(l:rgbElem)
        if !empty(s:color)
            let s:color = s:color.", ".l:rgbElem
        else
            let s:color = l:rgbElem
        endif
    endfor

    return s:color

endfunction
function s:Hex2RgbPerc(hexCol)
    " Convert from hex to rgb (%):
    " #FF00FF => 100%, 0, 100%

	let l:rgbCol = s:Hex2Rgb(a:hexCol)
	let l:color = s:Rgb2RgbPerc(l:rgbCol)

	return l:color

endfunction

" Main functions
" ************************
function s:VCoolor()

    let s:position = getpos(".")

    let l:oldCol = s:GetCurrCol()
    let l:newCol = s:ExecPicker(l:oldCol[1])

    if !empty(l:oldCol) && !empty(l:newCol)
        call s:SetColorByType(l:oldCol, l:newCol)
    endif

    call setpos(".", s:position)

endfunction

let &cpoptions = s:saveCpoptions
unlet s:saveCpoptions
