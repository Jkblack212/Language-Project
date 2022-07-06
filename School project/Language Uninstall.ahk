; Tree#3533, Language Project - Uninstall
; Version 0.10

#NoEnv ;Impore preformace by not checking empty variables against env ones.
#SingleInstance Force ;One instance of the program.
#Warn ;Tells about bugs.
SetWorkingDir %A_AppData% ;Sets the main directory to look for files in.
Sleep, 2000 ;Wait.
if !FIleExist(A_AppData . "\Language-Project-main\School project\Language Uninstall.ahk") ;See if it is still here.
{
	FileDelete, %A_AppData%\Language-Project-main ;Delete the file.
	FileDelete, %A_Desktop%\Language Project.lnk;Create a shortcut on the desktop ;Delete the Shortcut on dektop.
	FileDelete, %A_Programs%\Language Project Files.lnk;Create a shortcut in the startmenu ;Delete the shortcut in startmenu.
}
else
{
	FileCopy, %A_ScriptFullPath%, %A_Desktop%\Delete-me.exe ;Moves the file to allow deleting.
	Run, %A_Desktop%\Delete-me.exe ;Runs it.
	ExitApp
	OnExit("Exit")
}

Exit()
{
	FileDelete, %A_ScriptFull_Path%
}