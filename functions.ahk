/**
 * 快速打开或切换到指定 app
 * 如果 dir 是快捷方式路径，此函数不能实现单开
 * 
 * @params {string} dir app.exe dir
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