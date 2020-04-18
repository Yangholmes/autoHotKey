/**
 * 键盘映射
 */
#Include ./functions.ahk

/**
 * spy process path (pp + Enter/Space/.)
 */
:c:pp::
pp := WinGetProcessPath("A")
MsgBox( pp )
Return

/**
 * (Win + t)
 * copy path into clipboard
 * then open Terminal
*/
#t::
copyPath("cd ", True)
Run("C:\Users\Yangholmes\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools\Windows Terminal.lnk")
Return

/**
 * open Sublime (sbt + Enter/Space/.)
 */
:c:sbt::
quickRunApp("C:\Program Files\Sublime Text 3\sublime_text.exe")
Return

/**
 * open MobaXterm (Win + Alt + t)
 */
#!t::
toggleApp("C:\Program Files (x86)\Mobatek\MobaXterm\MobaXterm.exe")
Return

/**
 * open wechat (Win + Shift + w)
 */
#+w::
toggleApp("C:\Program Files (x86)\Tencent\WeChat\WeChat.exe")
Return

/**
 * open chrome (Win + Shift + c)
 */
#+c::
quickRunApp("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
Return

/**
 * open edge (Win + Shift + c)
 */
#+e::
quickRunApp("C:\Program Files (x86)\Microsoft\Edge Beta\Application\msedge.exe")
Return

/**
 * set/unset current active window always ontop
 */
#!Up::WinSetAlwaysOnTop(1, "A")
Return
#!Down::WinSetAlwaysOnTop(0, "A")
Return

/**
 * 拓展 MobaXterm 快捷键
 * 复制选中文本
 */
!+c::
prossName := WinGetProcessName("A")
if (prossName == "MobaXterm.exe") {
    control := ControlGetFocus("A")
    text := SendMessage(0x301, , , control, "A")
}
Return

/**
 * 拓展 MobaXterm 快捷键
 * 粘贴选中文本
 */
!+v::
prossName := WinGetProcessName("A")
if (prossName == "MobaXterm.exe") {
    MouseClick("Right")
}
Return
