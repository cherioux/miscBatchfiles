;Copyright (c) Cherioux, 2016 - 2019. All rights reserved.
;;; just some nice keyboard shortcut modifiers :) ;;;
	{
;;; makes it easier to create folders in windows,, ctrl + Q
 ^q::
    send, ^+n
return
 }
		{
;;; if explorer.exe is active, pressing F2 will bring up the selection menu. Tab to select, enter to open.
if winActive explorer.exe
 F2::
	send, <#2
return
 }

	{
;;; if firefox is active, will open firefox window. if there are multiple firefox windows, will bring up selection menu. Press F1.
if winActive firefox.exe
 F1::
	send, <#1
return
 }

	{
;;;opens Spotify. Same as above. Press F3.
if winActive Spotify.exe
 F3::
	send, <#5
return
 }

	{
;;;opens Task Manager. Same as above. Press F4
if winActive Taskmgr.exe
 F4::
	send, <#3
return
}

	{
;;;opens notepad++, same as above. Press F5.
if winActive notepad++.exe
 F5::
	send, <#8
return
 }
 
	{
;;;	
if winActive atom.exe
 +F1::
	send, #7
return
 }
 
	{
if winActive explorer.exe
 ^+q::
	send, F2
return
  }
 
 
 
 
 
 
 
 
 
 
 