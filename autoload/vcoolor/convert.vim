" Color conversion functions.

" Creation     : 2015-04-04
" Modification : 2016-02-21
" Maintainer   : Kabbaj Amine <amine.kabb@gmail.com>
" License      : This file is placed in the public domain.

fun! vcoolor#convert#HtmlBaseColName() " {{{1
	" Return a dictionnary of the 140 html base colors
	" http://www.w3schools.com/tags/ref_colornames.asp

	return {
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
endfun
" }}}
fun! vcoolor#convert#Rgb2Hex(rgbCol) " {{{1
    " Convert from rgb to hex:
    " 255, 0, 255 => #FF00FF

    let l:rgbCol = substitute(a:rgbCol, " ", "", "g")       " Remove spaces.
    let l:rgbColL = split(l:rgbCol, ",")

    let l:color = ""
    for l:element in copy(l:rgbColL)
		let l:hexElem = printf('%02X', l:element)
        let l:color = l:color.l:hexElem
    endfor

    return "#".l:color

endfun
fun! vcoolor#convert#Rgb2RgbPerc(rgbCol) " {{{1
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

    return l:color

endfun
fun! vcoolor#convert#RgbPerc2Hex(rgbPercCol) " {{{1
    " Convert from rgb (%) to hex:
    " 100%, 0%, 100% => #FF00FF

    let l:rgbCol = vcoolor#convert#RgbPerc2Rgb(a:rgbPercCol)
    let l:color = vcoolor#convert#Rgb2Hex(l:rgbCol)

    return l:color

endfun
fun! vcoolor#convert#RgbPerc2Rgb(rgbPercCol) " {{{1
    " Convert from rgb (%) to rgb:
    " 100%, 0%, 0% => 255, 0, 0

    let l:rgbPercCol = substitute(a:rgbPercCol, " ", "", "g")
    let l:rgbPercCol = substitute(l:rgbPercCol, "%", "", "g")   " Remove %.
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

endfun
fun! vcoolor#convert#Hex2Lit(hexCol) " {{{1
    " Convert from hex to literal name.
    " #FF0000 => red

	let l:htmlBaseColors = vcoolor#convert#HtmlBaseColName()
    let l:colIndex = index(values(l:htmlBaseColors), toupper(a:hexCol))

    if l:colIndex != -1
        let s:color =get(keys(l:htmlBaseColors), l:colIndex)
    else
        let s:color = a:hexCol
    endif

    return s:color

endfun
fun! vcoolor#convert#Hex2Rgb(hexCol) " {{{1
    " Convert from hex to rgb:
    " #FF00FF => 255, 0, 255

    let l:hexColL = matchlist(a:hexCol, '#\([0-9A-F]\{1,2}\)\([0-9A-F]\{1,2}\)\([0-9A-F]\{1,2}\)')
    " Remove 1st and empty values.
    call remove(l:hexColL, 0)
    call remove(l:hexColL, 3, -1)

    let l:color = ""
    for l:element in l:hexColL
        let l:rgbElem = str2nr(l:element, 16)
        let l:rgbElem = string(l:rgbElem)
        if !empty(l:color)
            let l:color = l:color.", ".l:rgbElem
        else
            let l:color = l:rgbElem
        endif
    endfor

    return l:color
endfun
fun! vcoolor#convert#Hex2RgbPerc(hexCol) " {{{1
    " Convert from hex to rgb (%):
    " #FF00FF => 100%, 0, 100%

    let l:rgbCol = vcoolor#convert#Hex2Rgb(a:hexCol)
    let l:color = vcoolor#convert#Rgb2RgbPerc(l:rgbCol)

    return l:color

endfun
fun! vcoolor#convert#Rgb2Hsl(rgbCol) " {{{1
	" Convert from rgb to hsl:
	" 255, 0, 255 => 300, 100%, 50%
	" Algorithm from http://www.easyrgb.com/index.php?X=MATH&H=18#text18

    let l:rgbCol = substitute(a:rgbCol, " ", "", "g")       " Remove spaces.
    let l:rgbColL = split(l:rgbCol, ",")

	let l:r = l:rgbColL[0] / 255.0
	let l:g = l:rgbColL[1] / 255.0
	let l:b = l:rgbColL[2] / 255.0

	let l:min = vcoolor#misc#GetMinVal([l:r,l:g,l:b])
	let l:max = vcoolor#misc#GetMaxVal([l:r,l:g,l:b])
	let l:delta = l:max - l:min

	let l:l = (l:max + l:min) / 2.0

	if (l:delta == 0)
		" Achromatic.
		let l:h = 0
		let l:s = 0
	else
		if (l:l < 0.5)
			let l:s = l:delta / (l:max + l:min)
		else
			let l:s = l:delta / (2 - l:max - l:min)
		endif

		let l:deltaR = ( ( ( l:max - l:r ) / 6.0 ) + ( l:delta / 2.0 ) ) / l:delta
		let l:deltaG = ( ( ( l:max - l:g ) / 6.0 ) + ( l:delta / 2.0 ) ) / l:delta
		let l:deltaB = ( ( ( l:max - l:b ) / 6.0 ) + ( l:delta / 2.0 ) ) / l:delta

		if (l:r == l:max)
			let l:h = l:deltaB - l:deltaG
		elseif (l:g == l:max)
			let l:h = (1/3.0) + l:deltaR - l:deltaB
		elseif (l:b == l:max)
			let l:h = (2/3.0) + l:deltaG - l:deltaR
		endif

		if (l:h < 0)
			let l:h = l:h + 1
		endif
		if (l:h > 1)
			let l:h = l:h - 1
		endif
	endif

	let l:h = float2nr(abs(round(l:h * 360)))
	let l:s = float2nr(abs(round(l:s * 100)))
	let l:l = float2nr(abs(round(l:l * 100)))

	let l:color = l:h.", ".l:s."%, ".l:l."%"

	return l:color

endfun
fun! vcoolor#convert#Hsl2Rgb(hslCol) " {{{1
	" Convert from hsl to rgb:
	" 300, 100%, 50% => 255, 0, 255
	" Algorithm from http://www.easyrgb.com/index.php?X=MATH&H=18#text18

	let l:hslColL = matchlist(a:hslCol, '\([ ]*[0-9]\{1,3}[ ]*\),\([ ]*[0-9]\{1,3}%[ ]*\),\([ ]*[0-9]\{1,3}%[ ]*\)')
	call remove(l:hslColL, 0)
	call remove(l:hslColL, 3, -1)

	let l:h = str2float(l:hslColL[0]) / 360
	let l:s = str2float(l:hslColL[1]) / 100
	let l:l = str2float(l:hslColL[2]) / 100

	if (l:s == 0)
		let l:r2 = l:l * 256.0
		let l:g2 = l:l * 255.0
		let l:b2 = l:l * 255.0
	else
		if (l:l < 0.5)
			let l:varTp2 = l:l * (1 + l:s)
		else
			let l:varTp2 = (l:l + l:s) - (l:s * l:l)
		endif

		let l:varTp1 = 2 * l:l - l:varTp2

		let l:r2 = float2nr(round(255 * vcoolor#convert#Hue2Rgb(l:varTp1, l:varTp2, (l:h + (1/3.0)))))
		let l:g2 = float2nr(round(255 * vcoolor#convert#Hue2Rgb(l:varTp1, l:varTp2, l:h)))
		let l:b2 = float2nr(round(255 * vcoolor#convert#Hue2Rgb(l:varTp1, l:varTp2, (l:h - (1/3.0)))))
	endif

	let l:color = string(l:r2) . ", " . string(l:g2) . ", " . string(l:b2)

	return l:color

endfun
fun! vcoolor#convert#Hue2Rgb(v1, v2, vH) " {{{1

	let l:v1 = a:v1
	let l:v2 = a:v2
	let l:vH = a:vH

	if (l:vH < 0)
		let l:vH = l:vH + 1
	endif
	if (l:vH > 1)
		let l:vH = l:vH - 1
	endif
	if ((6.0 * l:vH) < 1)
		return (l:v1 + (l:v2 - l:v1) * 6.0 * l:vH)
	endif
	if ((2.0 * l:vH) < 1)
		return (l:v2)
	endif
	if ((3.0 * l:vH) < 2)
		return (l:v1 + (l:v2 - l:v1) * ((2 / 3.0) - l:vH) * 6.0)
	endif

	return l:v1

endfun
fun! vcoolor#convert#Hsl2Hex(hslCol) " {{{1
	" Convert from hsl to hex:
	" 300, 100%, 50% => #FF00FF

	let l:rgbCol = vcoolor#convert#Hsl2Rgb(a:hslCol)
	let l:color = vcoolor#convert#Rgb2Hex(l:rgbCol)

	return l:color

endfun
fun! vcoolor#convert#Hex2Hsl(hexCol) " {{{1
	" Convert from hex to hsl:
	" #FF00FF => 300, 100%, 50%

	let l:rgbCol = vcoolor#convert#Hex2Rgb(a:hexCol)
	let l:color = vcoolor#convert#Rgb2Hsl(l:rgbCol)

	return l:color

endfun
" }}}

" vim:ft=vim:fdm=marker:fmr={{{,}}}:
