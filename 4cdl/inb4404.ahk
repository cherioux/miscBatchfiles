/*
;***********************************************************
;//+-------------------------------------------------------|
;//;;2021                                                  |
;//;;inb4404.ahk:AutoHotkey script to launch inb4404.py    |
;//;;Starts on boot. Launches inb4404.bat && autofills.    |
;//;;v1 ScriptLoc: /Projects/Script                        |
;//+-------------------------------------------------------|
;***********************************************************
*/
; #Warn ;Enable if errors to troubleshoot faster; error window should open automatically regardless
#SingleInstance
#NoEnv 
SendMode Input ;Speedy boi
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
		{ ; Only works with 4Chan threads
		!+F2:: ; opens batch sends python file with params && clipboard content
	run, inb4404.bat
   sleep 200
    send, inb4404.py -cdnt{SPACE}%Clipboard%
return
 }
	
	
	
	
	