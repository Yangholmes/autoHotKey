; ::btw::by the way

; ::sbt::
; Run("C:\Program Files\Sublime Text 3\sublime_text.exe")
; ReturnP

; appDir := "C:\Program Files\Internet Explorer\iexplore.exe"
; appDir := "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
; #If WinExist("ahk_exe " appDir)
; ; #Space::MsgBox "You pressed Win+Spacebar in " appDir
; #Space::WinActivate
; #If
; #Space::WinActivate("ahk_exe " appDir)

; #Space::
; if (WinExist("ahk_exe " appDir)) {
; 	WinActivate
; }
; else {
; 	MsgBox "hey"
; 	Run(appDir)
; }
; Return

; #Space::
; pp := WinGetProcessPath("A")
; MsgBox( pp )
; Return

#+q::
winInfo := WingetText("A")
infoArr := StrSplit(winInfo, "`n")
For info in infoArr {
    if InStr(info, "Address:") {
        path := RegExReplace(info, "^Address: ", "")
    }
}
Clipboard := path
MsgBox( path )