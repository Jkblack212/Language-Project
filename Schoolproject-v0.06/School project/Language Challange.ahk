﻿; James Blackwell, Language Project - Challange
; Version 0.06

#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

Translen := -1
Natilen := -1
Filereadline, Foreign, .\data\Settings.sdb, 7
Loop, read, .\data\Trans.sdb
	Translen += 1
Loop, read, .\data\Native.sdb
	Natilen += 1
Random, Pos, 2, %Translen%
if (Pos = 1)
	Pos += 1
Filereadline, Native, .\data\Native.sdb, %Pos%
Filereadline, Translation, .\data\Trans.sdb, %Pos%

Gui, Chall:New	, -MaximizeBox -MinimizeBox +AlwaysOnTop		, Challenge

Gui, Chall:Add	, GroupBox		, xm ym+10 	Section w200 h80	, Learning:
if Foreign
	Gui, Chall:Add	, Text		, xs+10 ys+20					, %Translation%
else
	Gui, Chall:Add	, Text		, xs+10 ys+20					, %Native%
Gui, Chall:Add	, Edit			, xs+10 ys+40 	vAnswer

Gui, Chall:Add	, Button		, xm ym+100	w80 gButtonSub		, Submit
Gui, Chall:Show	, W300
Return

ButtonSub:
	Gui, Chall:Submit, NoHide
	Gui, ChallA:New	, -MaximizeBox -MinimizeBox +AlwaysOnTop +OwnerChall, Challenge
	if Foreign
	{
		if (Answer == Native)
		{
			Gui, ChallA:Add	, Text,, You got it correct well done.
			Gui, ChallA:Add	, Button		, xm ym+30	w80 gButtonExit		, Finish
		}
		else
			Gui, ChallA:Add	, Text,, You got it wrong try again.
	}
	else
	{
		if (Answer == Translation)
		{
			Gui, ChallA:Add	, Text,, You got it correct well done.
			Gui, ChallA:Add	, Button		, xm ym+30	w80 gButtonExit		, Finish
		}
		else
			Gui, ChallA:Add	, Text,, You got it wrong try again.
	}
	Gui, ChallA:Show, w200
Return

ChallGuiClose:
ButtonExit:
	Gui, Main:Destroy
ExitApp
