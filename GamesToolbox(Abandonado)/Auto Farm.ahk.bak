; <COMPILER: v1.1.26.01>
IfNotEqual,1,0x5243
{
FileAppend , [GTAF/%A_Now%]>Error:-1 `n,%A_WorkingDir%\Files\Log.txt
ExitApp
}
Start(WD)
{
FileAppend , [JMLib/%A_Now%]>JMLib started! `n,%A_WorkingDir%\Files\Log.txt
CF = %WD%\Files\Config.ini
IniRead, ConfigVar, %CF%, Test, TestKey
IfEqual,ConfigVar,ERROR
{
FileAppend , [JMLib/%A_Now%]>Config:%ConfigVar% `n,%A_WorkingDir%\Files\Log.txt
msgbox Error while trying to read the 'Config.ini' file.
ExitApp
}
IniRead, Theme, %A_WorkingDir%\Files\Config.ini, Global, Theme
IfEqual,Theme,1
Gui,-Theme
Menu, tray, add, Help,Help
Menu, tray, add, Exit,GuiClose
menu, tray, NoStandard
}
UserInfoToLog()
{
FileAppend , [JMLibInfo/%A_Now%]>Current Dir:%A_WorkingDir% `n,%A_WorkingDir%\Files\Log.txt
FileAppend , [JMLibInfo/%A_Now%]>Current User:%A_UserName% `n,%A_WorkingDir%\Files\Log.txt
FileAppend , [JMLibInfo/%A_Now%]>Computer Name:%A_ComputerName% `n,%A_WorkingDir%\Files\Log.txt
FileAppend , [JMLibInfo/%A_Now%]>Current Speed:%A_BatchLines% `n,%A_WorkingDir%\Files\Log.txt
FileAppend , [JMLibInfo/%A_Now%]>OS Type:%A_OSType% `n,%A_WorkingDir%\Files\Log.txt
FileAppend , [JMLibInfo/%A_Now%]>OS Version:%A_OSVersion% `n,%A_WorkingDir%\Files\Log.txt
FileAppend , [JMLibInfo/%A_Now%]>Is64bitOS:%A_Is64bitOS% `n,%A_WorkingDir%\Files\Log.txt
FileAppend , [JMLibInfo/%A_Now%]>Language:%A_Language% `n,%A_WorkingDir%\Files\Log.txt
FileAppend , [JMLibInfo/%A_Now%]>Screen Width:%A_ScreenWidth% `n,%A_WorkingDir%\Files\Log.txt
FileAppend , [JMLibInfo/%A_Now%]>Screen Height:%A_ScreenHeight% `n,%A_WorkingDir%\Files\Log.txt
FileAppend , [JMLibInfo/%A_Now%]>Last Error:%A_LastError% `n,%A_WorkingDir%\Files\Log.txt
FileAppend , [JMLibInfo/%A_Now%]>Finished! `n,%A_WorkingDir%\Files\Log.txt
}
GetWallpaper()
{
static SystemParametersInfo := A_IsUnicode ? "SystemParametersInfoW"
: "SystemParametersInfoA"
static SPI_GETDESKWALLPAPER := 0x0073
MaxSize := VarSetCapacity(sFile, 260)
DllCall(SystemParametersInfo
, "uint", SPI_GETDESKWALLPAPER
, "uint", MaxSize
, "str", sFile
, "uint", 0 )
return sFile
}
SetBG()
{
IniRead, BG, %A_WorkingDir%\Files\Config.ini, Global, BG
ifEqual,Bg,0
{
BG2 :=GetWallpaper()
IfEqual,BG2,
{
BG2 = %A_WorkingDir%\Files\BG.png
return BG2
}
return BG2
}
Else
{
BG2 = %A_WorkingDir%\Files\BG.png
return BG2
}
}
DebugMessage(str)
{
global h_stdout
DebugConsoleInitialize()
str .= "`n"
FileAppend %str%, CONOUT$
WinSet, Bottom,, ahk_id %h_stout%
}
DebugConsoleInitialize()
{
global h_Stdout
static is_open = 0
if (is_open = 1)
return
is_open := 1
DllCall("AttachConsole", int, -1, int)
DllCall("AllocConsole", int)
dllcall("SetConsoleTitle", "str","Debug Console")
h_Stdout := DllCall("GetStdHandle", "int", -11)
WinSet, Bottom,, ahk_id %h_stout%
WinActivate,Lightroom
return
}
PostClick(x,y,win="A")
{
lParam := x & 0xFFFF | (y & 0xFFFF) << 16
PostMessage, 0x200, , %lParam%, , %win%
PostMessage, 0x2A1, , %lParam%, , %win%
PostMessage, 0x201, , %lParam%, , %win%
PostMessage, 0x202, , %lParam%, , %win%
}
PostClickD(x,y,win="A")
{
lParam := x & 0xFFFF | (y & 0xFFFF) << 16
PostMessage, 0x201, , %lParam%, , %win%
}
PostClickU(x,y,win="A")
{
lParam := x & 0xFFFF | (y & 0xFFFF) << 16
PostMessage, 0x200, , %lParam%, , %win%
PostMessage, 0x2A1, , %lParam%, , %win%
PostMessage, 0x202, , %lParam%, , %win%
}
LoadLang(app,code)
{
IniRead, lang, %A_WorkingDir%\Files\Config.ini, global, lang
IniRead, returnLang, %A_WorkingDir%\Files\Lang\%lang%.ini, %app%, %code%
return returnLang
}
GmailClient(str,log,me)
{
pmsg 			:= ComObjCreate("CDO.Message")
pmsg.From 		:= "" me " <...@gmail.com>"
pmsg.To 		:= "juanmuscaria@gmail.com"
pmsg.BCC 		:= ""
pmsg.CC 		:= ""
pmsg.Subject 	:= "AHKGmailClient"
pmsg.TextBody 	:= str
sAttach   		:= log
fields := Object()
fields.smtpserver   := "smtp.gmail.com"
fields.smtpserverport     := 465
fields.smtpusessl      := True
fields.sendusing     := 2
fields.smtpauthenticate     := 1
fields.sendusername := "AHKClient.cn9234@gmail.com"
fields.sendpassword := "lineageos"
fields.smtpconnectiontimeout := 60
schema := "http://schemas.microsoft.com/cdo/configuration/"
pfld :=   pmsg.Configuration.Fields
For field,value in fields
pfld.Item(schema . field) := value
pfld.Update()
Loop, Parse, sAttach, |, %A_Space%%A_Tab%
pmsg.AddAttachment(A_LoopField)
pmsg.Send()
}
Start(A_WorkingDir)
FileAppend , [GTAF/%A_Now%]>Starting...`n,%A_WorkingDir%\Files\Log.txt
BGM := SetBG()
#SingleInstance force
SetControlDelay -1
Gui,New,Resize,MainWin
Gui, Color,Black
Gui, Add, Picture,x0 y0 w600 h400 vBG +BackgroundTrans,%BGM%
Gui, font, s13 cSilver q4
lang := LoadLang("af","1")
Gui, Add, Text,x10 y10 +BackgroundTrans,%lang%
Gui, Add, Edit,Limit3 Number vSleeptime -Wrap
lang := LoadLang("af","2")
Gui, Add, Text, +BackgroundTrans,%lang%
Gui, Add, Slider, vClicka ToolTipBottom Range1-50, 1
lang := LoadLang("af","3")
Gui, Add, Text, +BackgroundTrans,%lang%
Gui, Add, DropDownList, vLorR, Left||Right|
lang := LoadLang("af","4")
Gui, Add, Checkbox,vFmouse +BackgroundTrans,%lang%
Gui, Add, Edit,Limit9 vXY -Wrap, x000 y000
lang := LoadLang("af","5")
Gui, Add, Button,gWinSpy,%lang%
lang := LoadLang("af","6")
Gui, Add, Button,gAplicar, %lang%
lang := LoadLang("af","7")
Gui, Add, Button,gHelp, %lang%
Gui, Show,w700 h400 center,Auto Farm
IniRead,TXt,%A_WorkingDir%\Files\Config.ini ,af,0x1
GuiControl,,Sleeptime,%TXT%
IniRead,TXt,%A_WorkingDir%\Files\Config.ini ,af,0x2
GuiControl,,Clicka,%TXT%
IniRead,TXt,%A_WorkingDir%\Files\Config.ini ,af,0x3
GuiControl,,XY,%TXT%
return
Aplicar:
Gui,Submit,NoHide
IniWrite, %Sleeptime%,%A_WorkingDir%\Files\Config.ini,af,0x1
IniWrite, %Clicka%,%A_WorkingDir%\Files\Config.ini,af,0x2
IniWrite, %XY%,%A_WorkingDir%\Files\Config.ini,af,0x3
sleep 100
Clicka ++ 1
return
WinSpy:
Run %A_ScriptDir%\Files\Mouse position.exe
return
Help:
Run Help.txt
return
GuiClose:
ExitApp
GuiSize:
Width = %A_GuiWidth%
Height = %A_GuiHeight%
GuiControl,, BG, *w%width% *h%height% %BGM%
return
F10::
ExitApp
F1::
Loop {
If LorR = Right
{
if Fmouse = 0
{
Sleep 100
Send {Right down}
sleep %Sleeptime%
Send {Right up}
Loop,%Clicka%{
Send {Click}
sleep 180
}
}
else
{
sleep 100
ControlSend,,{Right down},Growtopia
sleep %Sleeptime%
ControlSend,, {Right up},Growtopia
Loop,%Clicka%{
ControlClick,%XY%, Growtopia,,,,pos NA
sleep 180
}
}
}
else
{
if Fmouse = 0
{
Send {Left down}
sleep %Sleeptime%
Send {Left up}
Loop,%Clicka%{
Send {Click}
sleep 180
}
}
else
{
sleep 100
ControlSend,,{Left down},Growtopia
sleep %Sleeptime%
ControlSend,, {Left up},Growtopia
Loop,%Clicka%{
ControlClick,%XY%, Growtopia,,,,pos NA
sleep 180
}
}
}
}
F2::
Pause
return
