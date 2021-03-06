/*
v1.0
Esse app está em beta.
Verção do binario usado:1.1.28.0


Listas de GUI
1J-JMtools
2-MC_ModpackManager
3-GT_AutoFarm
4-UniKey
5-
6-
S1-ConfigAll
S2-ConfigKey
*/
;----------------------------------
;Directives
;----------------------------------
;#Warn
;#NoTrayIcon
#NoEnv
#Persistent
#SingleInstance force
#Include %A_ScriptDir%\lib\AhkDllThread.ahk
;----------------------------------
;Start
;----------------------------------

Debug := AhkDllThread("AutoHotkey.dll")
FileAppend JMtools © Muscariaware 2018 `n, * ;SciTE out
FileAppend Versão 1.0 `n, * ;SciTE out 
FileAppend  `n, * ;SciTE out
FileAppend  Starting`n, * ;SciTE out
global WB
global GlobalLang
Logo(1,"")
LoadConfigs()
SendMode Input
SetWorkingDir %A_ScriptDir%
SetBatchLines, -1
SetKeyDelay, -1
SetControlDelay, -1
SetMouseDelay, -1
SetWinDelay, -1
SendMode Input
goto, Scripts
Start1:
Debug.ahkdll(A_ScriptDir "\lib\Debug Console.ahk") ;Debug.ahktextdll("`nDebugMessage("")")
Debug.ahkExec("DebugMessage("DebugConsoleInitialize()")
Menu,Tray ,Icon , lib\JMi.dll,2,1
Menu, Tray, Tip, JMtools tray incon
Menu, tray, NoStandard
Menu, tray, add, Exit,Exit
Menu, tray, add, Help,Help
;Hotkeys
Hotkey, F8 , ReloadThis ;Reload
;-------
;sleep 3000
Update()
Logo(0,"")
FileAppend %GlobalLang% `n, * ;SciTE out



;----------------------------------
;Global vars
;----------------------------------
App = 1
App4Bstate = 0
BoardState = 1
;----------------------------------
;GUI:JMtools
;----------------------------------
;Menu
Menu, Configs, add, Gerais, ConfigAll
Menu, Configs, add, Hotkeys, ConfigKey
Menu, JMmenu, add, Configurações, :Configs

;GUI

Gui, 1J: New, , JMtools
Gui, 1J: Menu, JMmenu

Gui, 1J: Add,Button,x10 y10 gMC_ModpackManager +BackgroundTrans, % LoadLang("JMtools","B1") ;MC Modpack Manager
Gui, 1J: Add,Button, gGT_AutoFarm +BackgroundTrans, % LoadLang("JMtools","B2") ;GT AutoFarm
Gui, 1J: Add,Button, gUniKey +BackgroundTrans, % LoadLang("JMtools","B3") ;UniKey


Gui, 1J: Show,h300 w500
return



;----------------------------------
;GUI:MC_ModpackManager
;----------------------------------
MC_ModpackManager:
App = 2
Gui, 1J: Submit
Gui, 2: New, , Modpack Manager
Gui, 2: Add, Button,x10 y10 gBack,Back

Gui, 2: Show,h300 w500
return

;----------------------------------
;GUI:GT_AutoFarm
;----------------------------------
GT_AutoFarm:
App = 3
Gui, 1J: Submit
Gui, 3: New, , Auto Farm
Gui, 3: Add,Button,gBack x10 y10,Back

Gui, 3: Show,h300 w500
return

;----------------------------------
;GUI:UniKey
;----------------------------------
UniKey:
App = 4
Gui, 1J: Submit
Gui, 4: New, , UniKey
Gui, 4: Add,Button,gBack x10 y10,Back
Gui, 4: Add,text,+BackgroundTrans ,Aperte "RControl" para ativar/desativar
Gui, 4: Add,text,+BackgroundTrans vTxTUK,Aperte RControl para iniciar!
Gui, 4: Show,h100 w300
return

#if App = 4
RControl::
If App4Bstate = 1
{
	App4Bstate = 0
	GuiControl,4:,TxTUK,Desativado! 

}
else
{
	App4Bstate = 1
	GuiControl,4:,TxTUK,Ativado!
}
return
	

1::
2::
3::
4::
5::
6::
7::
8::
9::
BoardState = %A_ThisHotkey%
return
a::
b::
c::
d::
e::
f::
g::
h::
i::
j::
K::
l::
m::
n::
o::
p::
q::
r::
s::
t::
u::
v::
w::
x::
y::
z::
IniRead, Key, %A_WorkingDir%\res\Configs\UniTable.ini, %BoardState%, %A_ThisHotkey% ;, %A_Space%
Send {%Key%}
return
;----------------------------------
;GUI:ConfigAll
;----------------------------------
ConfigAll:
Gui, S1: New, , Configure


Gui, S1: Show,h300 w500
return
;----------------------------------
;GUI:ConfigKey
;----------------------------------
ConfigKey:
Gui, S2: New, , Hotkeys


Gui, S2: Show,h300 w500
return
;----------------------------------
;Label
;----------------------------------
Minimz:
WinMinimize, A
return
UImove:
PostMessage, 0xA1, 2,,, A
return

Back:
Gui, Submit
Save()
Gui, 1J: Show,h300 w500
App = 1
return

Help:
return

Exit:
ExitApp

ReloadThis:
reload
F12::
Msgbox %App% `n %App4Bstate%
return
;----------------------------------
;Functions
;----------------------------------
Logo(State,str)
{
	IfEqual, State,0
	{
		Gui, Logo: Destroy 
	}
	IfEqual, State,1
	{
		Gui,Logo: New,AlwaysOnTop -Caption ToolWindow,Logo
		Gui Logo: Add, ActiveX, x-10 y-15 w256 h256 vWB, Shell.Explorer
		Gui Logo: +LastFound
		Gui Logo: +Disabled
		WinSet, TransColor, FFFFFF
		var = %A_WorkingDir%\res\img\Loading.gif
		wb.Navigate("about:blank")
		html := "<html>`n<title>name</title>`n<body>`n<img src=""" var """ >`n</body>`n</html>"
		wb.document.write(html)
		Gui, Logo: Show, h128 w128
	}
	IfEqual, State,3
	{
	}
}

Update()
{
	
}

1JGuiClose(GuiHwnd) {
	Lang1 := LoadLang("Global","TxT_Title_Exit")
	Lang := LoadLang("Global","TxT_Exit")
    MsgBox,  262180, %Lang1%, %Lang%
    IfMsgBox No
        return true
	ifMsgBox Yes
		FileAppend  `n, * ;SciTE out
	    ;FileAppend  %ErrorList&`n, * ;SciTE out
		FileAppend Salvando e fechando `n, * ;SciTE out
		Save()
        ExitApp
}
2GuiClose(GuiHwnd){
	global
	Gui, Submit
	Save()
	Gui, 1J: Show,h300 w500
	App = 1
}
3GuiClose(GuiHwnd){
	global
	Gui, Submit
	Save()
	Gui, 1J: Show,h300 w500
	App = 1
}
4GuiClose(GuiHwnd){
	global
	Gui, Submit
	Save()
	Gui, 1J: Show,h300 w500
	App = 1
}
LoadLang(GUI,ID){
	IniRead, LangR, %A_WorkingDir%\res\Lang\%GlobalLang%.ini, %GUI%, %ID%,
	return LangR
	
}

LoadConfigs(){
	;IniRead, OPut,File,Sec,Key
	IniRead, GlobalLang, %A_WorkingDir%\res\Configs\Config.ini, 00, 4C616E67
	
	;msgbox %GlobalLang%
}

ChekConfg(){
	
}

ResetConfig(){
	
}
Save(){
}



Scripts:
UniKeyScript = 
(
SendMode Input
SetWorkingDir %A_ScriptDir%
SetBatchLines, -1
SetKeyDelay, -1
SetControlDelay, -1
SetMouseDelay, -1
SetWinDelay, -1
SendMode Input
#Persistent
#NoTrayIcon
#NoEnv
BoardState= 1
1::
2::
3::
4::
5::
6::
7::
8::
9::
BoardState = %A_ThisHotkey%
return
a::
b::
c::
d::
e::
f::
g::
h::
i::
j::
K::
l::
m::
n::
o::
p::
q::
r::
s::
t::
u::
v::
w::
x::
y::
z::
IniRead, Key, %A_WorkingDir%\res\Configs\UniTable.ini, %BoardState%, %A_ThisHotkey% ;, %A_Space%
Send {%Key%}
return
)

goto, Start1