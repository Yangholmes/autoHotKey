/**
 * 快速打开或切换到指定 app
 * 如果 dir 是快捷方式路径，此函数不能实现单开
 *
 * @params {string} dir app.exe dir
 * @return {number} handle
 */
quickRunApp(dir) {
    handle := WinExist("ahk_exe " dir)
    if (handle) {
        WinActivate(handle)
        WinShow(handle)
    }
    else {
        handle := Run(dir)
    }
    return handle
}

/**
 * 复制资源管理器当前目录地址到剪贴板
 *
 * @params {string} prefix 前缀
 * @return {string} path raw path
 */
copyPath(prefix := "", quotation := False) {
    winInfo := WingetText("A")
    infoArr := StrSplit(winInfo, "`n")
    For info in infoArr {
        if InStr(info, "Address:") {
            path := RegExReplace(info, "^Address: ", "")
            path := RegExReplace(path, "`n|`r", "")
        }
    }
    if (path) {
        Clipboard := quotation
            ? prefix . "`"" . path . "`""
            : prefix . path
    }
    return path
}