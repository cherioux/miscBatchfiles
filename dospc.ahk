/*
;***********************************************************
;//+-------------------------------------------------------|
;//;;2016 - 2021. .                                        |
;//;;dospc.ahk - Windows modifier keys, some are helpful   |
;//;;  others should be removed ;nothing but p a i n       |
;//;;modifiers for increased productivity for me at least:)|
;//;;v1.6 File: dospc.ahk Loc: Desktop;Always              |
;//;;History: Dec-29-17-19 Cherioux Created *.ahk          |
;//+-------------------------------------------------------|
;***********************************************************
*/
	#Singleinstance
;Menu, Tray, Icon, shell32.dll, 18 ;changes the icon in the tray to a laptop with Inet globe to make more distinct. I don't use it anymore, I have no need to 
;Menu, Tray, Icon, G:\Program Files (x86)\battle.net.dll ;Changes tray icon to old B.net launcher icon. Commented out because don't use anymore, idk lol

	{
;;; makes it easier to create folders in windows,, ctrl + Q
 ^q::
    send, ^+n
return
 }
 
		{
;;; if explorer.exe is active, pressing Shift + F2 will bring up the selection menu. Tab to select, enter to open.<
if winActive explorer.exe
+F2::
	send, <#2
return
 }  
 
	{
 ^+a:: ;Press Ctrl Shift A to take a screenshot. Easier than Windows Printscreen, you only need one hand.
	send, #{PrintScreen}
   sleep 5
	send, {Lwin up} ;I've had issues with modifier keys getting stuck
return
;This code ended up being integrated with LGS for the G600, G15 runs line 33 of this thread.
}

	{
 !+F1:: ;Opens DOSBox. Mount DOSGames folder as C:. Mounts DVD drive. ;Not really applicable to anyone else however
 ;Doesn't work since Windows decided to ruin itself and now I have to go and reinstall DosBox, but I'm too lazy to. Might as well comment it out, but again too lazy to even do that. Fml
	run, C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe
   sleep 2200
	send, mount W W:\ -t cdrom {Enter}
   sleep 2500
	send, mount D C:\dos\dosgames {Enter}
   sleep 2500
    send, mount C C:\dos\win {Enter}
return
 }
 
	{ ;media controls ;Self
	;the bottom three aren't too useful anymore, considering that I have two keyboards in which both have physical volume controls, however, they're integrated in with LGS for the G600. 3rd key+G16/17 is volume, G18 is play/pause, and G16/17 is rewind and fast-forwards respectively. This code needs to stay intact.
 ^+Left::SoundSet,-1 ;sound control
 ^+Right::SoundSet,+1
 !Numpad0::Media_Play_Pause
 !Numpad1::Media_Prev
 !Numpad2::Media_Next
send, {Alt up}
return
}
;exploitation tools below
	{
 !+^F6:: ;Launches Veracrypt. Need to provide keyfile or 60-character password to open H:\(1.hc). Task Scheduler runs this part of the thread at system boot, whether I'm logged on or not. I won't be able to tell that this has ran until I log in and see the Veracrypt gui telling me to decrypt the drive, however. MS COFEE is a part of an old leak, only runs on Windows XP. I need to open this in a VM in order to utilize it.
	run, C:\Program Files\VeraCrypt\VeraCrypt.exe
    ;run, D:\Backup\dump\MSSrc.20200924\misc\wikileaks\microsoft-cofee\cofee.msi
;if needed keyfile is inside PC.
return 
 }
	{
!+^F7:: ;Runs Metasploit Console, but only after Veracrypt has been ran and 1.hc has been unlocked to the system. Does not start msfvenom; msfvenom is seperate from the console application. Is not ran on startup.
    run, cmd
   sleep 2000
    send, H: {enter}
	send, cd metasploit-framework\bin\{enter}
	send, msfconsole{enter}
return
 }
/*
;**************************************************************************************************
;Partly stolen then heavily modified from somewhere, I don't recall where I got it from. MOST likely taranVH, but I do NOT know if that's true anymore. Either way, doesn't work the way that I would have liked it to work, so it's commented out. Complete mess of spaghetti code, even though most is commented I don't have a clue what's going on anymore. vempire hehe*
	{
#InstallKeybdHook
#InstallMouseHook
#UseHook On
#KeyHistory 500

;Menu, Tray, Icon, imageres.dll, 16262 ;two windows ;Xbutton2 Xbutton1
DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr") ;shouldn't need if ever get all same monitors; thre to attempt scaling fix

If (A_AhkVersion < "1.0.39.00")
{
    MsgBox,20,,This script may not work properly with your version of AutoHotkey. Continue?
    IfMsgBox,No
    ExitApp
}
killFullScreen()
{
; ;these two lines below activate the window under the cursor. But I do NOT like that, so i commented them out.
; MouseGetPos,,, WinUMID
; WinActivate, ahk_id %WinUMID%

MouseGetPos, , , id, control
WinGetTitle, title, ahk_id %id%
WinGetClass, class2, ahk_id %id%
WinGet, chrStyle, ExStyle, ahk_id %id%
WinGet, chromeStyle, Style, ahk_id %id%
;ToolTip, ahk_id %id%`nahk_class %class2%`n%title%`nControl: %control%
;Tooltip, %taranStyle%
WinRestore, %title%

if (chrStyle = 0x00000000) ;i think this is just for firefox...?
{
tooltip, 0x00000000
sleep 100
tooltip,
sendinput, {F11} ;this MURDERS firefox's "full screen" mode, but does not induce it, because otherwise it would have been 0x00000100 or 0x00000110

sleep 10
;This i gotta say is GOOD ENOUGH, though I'd prefer to not have to use F11. I'd prefer to send whatever command is being sent by F11 (in firefox and Chrome.)
return
}

;i DO need a check here to be sure it's actaully chrome that's active.
if (chromeStyle = 0x160F0000)
{
tooltip, chromeStyle 0x160F0000
sleep 100
tooltip,
; send MButton ;activate chrome i guess.
; sleep 20
sendinput, {F11}
sleep 10 ;without this, chrome will instantly become whatever full screen SIZE is, while still in "full screen" mode.
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
;tooltip, %KDE_Win%
; Get the initial window position.
WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinStartW,KDE_WinStartH,ahk_id %KDE_id%
WinGetClass,fancyclass,ahk_id %KDE_id%
 MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    ; Get the current window position and size.
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    ; Then, act according to the defined region.
    WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; X of resized window
                            , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; Y of resized window
                            , KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; W of resized window
                            , KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; H of resized window
    KDE_X1 := (KDE_X2 + KDE_X1) ; Reset the initial position for the next iteration.
    KDE_Y1 := (KDE_Y2 + KDE_Y1)
}
return
}
;**************************************************************************************************
*/






;OldStuffs;
 ;;;}
 ;;;	{ ;media controls
 ;;;^+Left::SoundSet,-1 ;sound control
 ;;;^+Right::SoundSet,+1
 ;;;!Numpad0::Media_Play_Pause
 ;;;!Numpad1::Media_Prev
 ;;;!Numpad2::Media_Next
;;;return
;;; }
;;; 
;cherioux
;why is it called dospc? I'm retarded as fuck, I don't have a clue anymore bro
