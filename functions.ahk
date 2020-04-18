/**
 * 快速打开或切换到指定 app
 * 如果 dir 是快捷方式路径，此函数不能实现单开
 *
 * @params {string} dir app.exe dir
 * @return {number} handle
 */
quickRunApp(dir) {
    handle := WinExist("ahk_exe " dir)
    if (!handle) {
        handle := Run(dir)
    }
    WinActivate(handle)
    WinShow(handle)
    return handle
}

/**
 * 切换窗口 激活/最小化 状态
 *
 * @params {string} dir app.exe dir
 * @return {number} handle
 */
toggleApp(dir) {
    handle := WinActive("ahk_exe " dir)
    if (handle !== 0) {
        WinMinimize(handle)
    }
    else {
        handle := quickRunApp(dir)
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
    winInfo := WinGetText("A")
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