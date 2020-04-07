
#Include ./functions.ahk

/**
 * spy process path
 */
::spypp::
pp := WinGetProcessPath("A")
MsgBox( pp )
Return

/**
 * open Terminal
*/
#t::
Run("C:\Users\Yangholmes\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools\Windows Terminal.lnk")
Return

/**
 * open Sublime
 */
:c:sbt::
quickRunApp("C:\Program Files\Sublime Text 3\sublime_text.exe")
Return

/**
 * open MobaXterm
 */
#!t::
quickRunApp("C:\Program Files (x86)\Mobatek\MobaXterm\MobaXterm.exe")
Return

/**
 * open wechat
 */
#!w::
quickRunApp("C:\Program Files (x86)\Tencent\WeChat\WeChat.exe")
Return

/**
 * open chrome
 */
#!c::
quickRunApp("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
Return

/** 
 * set/unset current active window always ontop
 */
#!Up::WinSetAlwaysOnTop(1, "A")
Return
#!Down::WinSetAlwaysOnTop(0, "A")
Return