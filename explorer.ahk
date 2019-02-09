;Copyright (c) Cherioux, 2016 - 2019. All rights reserved.
;;; just some nice keyboard shortcut modifiers :) ;;;
;v1.06.00.6972
	{
;;; makes it easier to create folders in windows,, ctrl + Q
 ^q::
    send, ^+n
return
 }
		{
;;; if explorer.exe is active, pressing Shift + F2 will bring up the selection menu. Tab to select, enter to open.
if winActive explorer.exe
+F2::
	send, <#2
return
 }

	{
;;; if firefox is active, will open firefox window. if there are multiple firefox windows, will bring up selection menu. Press Shift + F1.
if winActive firefox.exe
 +F1::
	send, <#1
return
 }

	{
;;;opens Spotify. Same as above. Press Shift + F3.
if winActive Spotify.exe
 +F3::
	send, <#5
return
 }


	{
;;;opens notepad++, same as above. Press Shift + F5.
if winActive notepad++.exe
 +F5::
	send, <#8
return
 }
 
	{
;;;	
if winActive atom.exe
 ^+F1:: ;Press Ctrl Shift F1, opens atom.exe.
	send, #7
return
 }
 
	{
if winActive explorer.exe
 ^+q:: ;Press Ctrl Shift Q. I don't remember what this is supposed to do lol
	send, F2
return
  }
  
	{

if winActive everything.exe 
 ^F4::
	send, #4 ;starts everyhting.exe from (E:) steam. Press Ctrl F4.
  sleep 5
	send, {Lwin up} ;I've had issues with modifier keys getting stuck
return ;everthing.ex3e \ "E:\Program Files (x86)\Everything\Everything.exe"

  }
	{
 ^+a:: ;Press Ctrl Shift A to take a screenshot. Easier than Windows Printscreen, you only need one hand.
	send, #{PrintScreen}
   sleep 5
	send, {Lwin up} ;I've had issues with modifier keys getting stuck
return
}
 

 
