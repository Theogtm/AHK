#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Mouse, Client
SetMouseDelay, -1
return
^s::
loop {
Send {Left Down}
sleep 1000
Send {Left up}
sleep 5000
MouseClick, Right
sleep 1500
Send {Shift down}
sleep 500
loop 3{
MouseClick, , 573, 155
}
sleep 500
Send {Shift up}
sleep 500
Send {Esc}
sleep 1000
Send {Right Down}
sleep 1000
Send {Right up}
sleep 2000
MouseClick
sleep 1000
}
return
^z::
sleep 1000
Send {Left}
return
F1::
Pause

