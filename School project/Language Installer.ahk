﻿; Tree#3533, Language Project - Installer
; Version 0.09

#NoEnv ;Impore preformace by not checking empty variables against env ones.
#Warn ;Tells about bugs.
SetWorkingDir %A_AppData% ;Sets the main directory to look for files in.

UrlDownloadToFile, https://github.com/Jkblack212/Language-Project/archive/refs/heads/main.zip, %A_AppData%\Language-Project.zip ;Downloads the project
Sleep, 3000 ;Sleep for 3 seconds to allow the files to download.

sZip := A_Desktop . "\Language-Project.zip"
sUnz := A_Desktop
Sleep, 500
Unz(sZip,sUnz)
;The above two lines are input for the code below.

FileDelete, %A_AppData%\Language-Project.zip ;Deletes the zip file after it is done
FileCopy, Language Project.ahk, %A_AppData%
FileCreateShortcut, %A_AppData%\Language-Project-main\School project\Language Main.ahk, %A_AppData%\Language Project.Ink, %A_AppData%\Language-Project-main\School project,, Launch the language project, %A_AppData%\Language-Project-main\School project\Data\Icon.ico

MsgBox, Download Complete ;Give the user information.

;The following function was received from https://www.autohotkey.com/board/topic/60706-native-zip-and-unzip-xpvista7-ahk-l/
Unz(sZip, sUnz)
{
    fso := ComObjCreate("Scripting.FileSystemObject")
    If Not fso.FolderExists(sUnz)
       fso.CreateFolder(sUnz)
    psh  := ComObjCreate("Shell.Application")
    zippedItems := psh.Namespace( sZip ).items().count
	unzippedItems := 0
    psh.Namespace( sUnz ).CopyHere( psh.Namespace( sZip ).items, 4|16 )
    while (zippedItems > unzippedItems) {
        sleep 50
        unzippedItems := psh.Namespace( sUnz ).items().count
        ToolTip Unzipping in progress..
    }
    ToolTip
}