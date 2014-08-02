vCoolor - Simple color selector/picker plugin for Vim.
======================================================

Description
-----------

vCoolor is a Vim plugin that allows using a GTK+ color selection dialog via [Yad](http://sourceforge.net/projects/yad-dialog/) directly from the editor.

What this plugin do:

* Insert or modify a hex color even if there are many colors in 1 line.
* Modify a rgb color (Only one by line).

What this plugin doesn't do:

* Insert rgb (Can implement it if needed), rgba, hsv, hsva colors.
* Modify rgba, hsv (Working on it), hsva colors. 

![vCoolor](.img/screen.png)

**P.S**: This plugin works only on GNU/Linux (I'll try to find a good windows alternative in the future).

Installation
-------------

To use vCoolor, you need to have:

* [Yad](http://sourceforge.net/projects/yad-dialog/)
* The plugin [ConvertBase.vim](http://www.vim.org/scripts/script.php?script_id=54) *(You can use Vundle for that as described further)*.

### Manual installation

Install the distributed files into Vim runtime directory which is usually `~/.vim/`, or `$HOME/vimfiles` on Windows.

### Using Pathogen
If you're using pathogen, extract the files into `bundle` directory.

### Using Vundle (Best way)
Just add the following lines in the Vundle part of your vimrc:
    
    Plugin 'ConvertBase.vim'
	Plugin 'KabbAmine/vCoolor.vim'

Then proceed to the installation of the plugins with the following command:

	:PluginInstall

Usage
-----

In both NORMAL and INSERT modes, only 1 shortcut is needed: `<Alt-C>` (I find it very conveniant :D), but he may be not working on terminal.

Use it:

* To insert a color anywhere.
* To modify the current hex or rgb color.

Click on the image for a short screencast.

[![Screencast of vCoolor](.img/play-me.jpg)](https://www.youtube.com/watch?v=ZBJ_-Uxm55U)

### Commands

I've used some color conversion commands for debug purpose but I finally decided to keep them in the plugin, they may be useful.

Here they are with exemples to understand how they work:

	:Hex2Lit "#FF00FF"		" Gives "magenta"
	:Hex2Rgb "#FF00FF"		" Gives "255, 0, 255"
	:Rgb2Hex "255, 0, 255"	" Gives "#FF00FF"

Mapping
-------

To change the mapping by default, add to your *vimrc*.

	nmap <NEW_MAPPING> <Plug>vCoolor	" NORMAL mode
	imap <NEW_MAPPING> <Plug>vCoolorI	" INSERT mode

You can use the same mapping for both modes.

TODO
----

* Windows alternative.
* A better regex patterns.
* Handle rgb(%), rgba, hsv, hsva colors.
* Add possibility to modify 2 or more rgb colors in a line...
* Add a vim doc file.

Notes
-------------

I'm not very happy with the GTK selection color dialog via Yad (Very limited), but I didn't find a good alternative, I think that I can use python with pygtk but I prefer to stick with pure vimscript and the default unix shell (Bash in my case), so if you aware of something better, let me know.

Thanks
-------

To Yad's author.

To Bram Moolenaar for creating the best piece of software in the world :D

To you if you're using vCoolor.

