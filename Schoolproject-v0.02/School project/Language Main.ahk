; James Blackwell, Language Project
; Version 0.02

#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

Location := false
Translen := -1
Natilen := -1
Filereadline, hk, ./data/Settings.sdb, 2
Filereadline, Timeh, ./data/Settings.sdb, 4
Filereadline, Timem, ./data/Settings.sdb, 5
Filereadline, Foreign, ./data/Settings.sdb, 7
Check := (((Timeh*60)+Timem)*60)*1000
Settimer, Challange, %Check%
Loop, read, ./data/Trans.sdb
	Translen += 1
Loop, read, ./data/Native.sdb
	Natilen += 1

Hotkey, %hk%, Main
Return

Main:
	Gui, Main:New	, -MaximizeBox -MinimizeBox +AlwaysOnTop				, Settings

	Gui, Main:Add	, GroupBox		, xm 		ym+10 	Section w200 h82	, Settings:
	Gui, Main:Add	, Text			, xs+10		ys+22						, Time:
	Gui, Main:Add	, Edit			, xs+50 	ys+20	Number	w40 vTimeh	, %Timeh%
	Gui, Main:Add	, Text			, xs+50		ys+42						, (Hours)
	Gui, Main:Add	, Edit			, xs+100 	ys+20	Number	w40 vTimem	, %Timem%
	Gui, Main:Add	, Text			, xs+100	ys+42						, (Minutes)
	Gui, Main:Add	, Checkbox		, xs+10		ys+62	vForeign Checked%Foreign%, Enable Foreign --> Native

	Gui, Main:Add	, GroupBox		, xm		ym+112	Section w200 h62	, Hotkey:
	Gui, Main:Add	, Edit			, xs+40		ys+20	vhk w40				, %hk%
	Gui, Main:Add	, Text			, xs+10		ys+22						, Key:
	Gui, Main:Add	, Text			, xs+10		ys+42						, (Crtl:^, Alt: !, Shift: +, Win key: #)
	
	Gui, Main:Add	, GroupBox		, xm+220	ym+10	Section	w400 h172	, Words:
	Gui, Main:Add	, Edit			, xs+10 	ys+42	w185 r6 vNative
	Gui, Main:Add	, Text			, xs+10		ys+20						, Native: %Natilen%
	Gui, Main:Add	, Edit			, xs+205 	ys+42	w185 r6 vTrans
	Gui, Main:Add	, Text			, xs+205	ys+20						, Translation: %Translen%
	Gui, Main:Add	, Button		, xs+10		ys+142	w80 gWordupload		, Upload

	Gui, Main:Add	, Button		, xm		ym+196	w80 gButtonSave		, Save
	Gui, Main:Add	, Button		, xm+100	ym+196	w80 gButtonExit		, Exit
	Gui, Main:Show	, W640
Return

MainGuiClose:
ButtonExit:
	Gui, Main:Destroy
Return

ButtonSave:
	Gui, Main:Submit
	Gui, Main:Destroy
	Filedelete, ./data/Settings.sdb
	Fileappend, Hotkey:`n%hk%`nTime between popups:`n%Timeh%`n%Timem%`nForeign --> Native:`n%Foreign%, ./data/Settings.sdb
	Reload
Return

Wordupload:
	Gui, Main:Submit, Nohide
	Tlen := StrLen(Trans)
	NLen := StrLen(Native)
	if (Tlen = 0) or (Nlen = 0)
		Return
	Fileappend, `n%Native%, ./data/Native.sdb
	Fileappend, `n%Trans%, ./data/Trans.sdb
	Reload
Return

Challange:
	process, exist, .\Challange\Language Challange.ahk
	if ErrorLevel != 0
		Return
	Run, .\Challange\Language Challange.ahk
Return