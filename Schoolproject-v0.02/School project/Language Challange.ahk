#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

Location := false
nat := FileOpen("./data/Native.sdb", "r")
tran := FileOpen("./data/Trans.sdb", "r")
Filereadline, Foreign, ./data/Settings.sdb, 7


Gui, Chall:New	, -MaximizeBox -MinimizeBox +AlwaysOnTop		, Challenge

Gui, Chall:Add	, GroupBox		, xm ym+10 	Section w200 h80	, Learning:
Gui, Chall:Add	, Text			, xs xs+10						,Total words: %Natilen%

Gui, Chall:Add	, Button		, xm ym+175	w80 gButtonSub		, Submit
Gui, Chall:Show	, W300
Return

ButtonSub:
	Gui, Chall:Submit
Return
