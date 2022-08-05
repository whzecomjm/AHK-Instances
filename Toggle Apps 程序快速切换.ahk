#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force  ;脚本正在运行时, 启动该脚本时会跳过对话框并自动替换旧实例.
#NoTrayIcon  ;不显示托盘图标

;====================右键滚轮控制 Alt+Tab==========
; ~ 防止与 mouseInc 冲突
~RButton & WheelDown::AltTab
~RButton & WheelUp::ShiftAltTab


; ======================== 程序快速切换===================
;指定程序之间 的 快捷键切换，如果没打开则打开
;链接：https://www.zhihu.com/question/19645501/answer/637425288
RunOrActivateProgram(Program, WorkingDir="", WindowSize=""){ 
    SplitPath Program, ExeFile 
    Process, Exist, %ExeFile% 
    PID = %ErrorLevel% 
    if (PID = 0) { 
    Run, %Program%, %WorkingDir%, %WindowSize% 
    }else{ 
    WinActivate, ahk_pid %PID% 
    } 
}

!z:: ;打开or切换Chrome浏览器  Alt+Z
RunOrActivateProgram("C:\Users\whzec\Documents\Cent\App\chrome.exe")
return 

!x:: ;打开or切换pdf Alt+X
RunOrActivateProgram("D:\Program Files\PDF-XChange Editor Plus\PDFXEdit.exe")
return

;打开or切换notepad3 Alt+N
!n::
RunOrActivateProgram("D:\Program Files\NotePad3\Notepad3\Notepad3.exe")
return 

;打开or切换Typora
;之前只有Typora不灵，这种方式就可以诶
!c::   ;Alt+C
DetectHiddenWindows, On
SetTitleMatchMode, 2
WinGet, winid, ID, Typora
;MsgBox,%winid%
SetTitleMatchMode, 1
If (winid) {
WinWait, ahk_id %winid%
WinShow
WinActivate
ControlFocus, EditComponent2, A
ControlSetText, EditComponent2,, A
}else{
RunOrActivateProgram("D:\Program Files\Typora\Typora.exe")
}
DetectHiddenWindows, Off
return

; ======== 直接的切换方法 =====

#f:: ;打开 Everything
IfWinExist "Everything"
WinActivate
else
run "D:\Shortcuts\Everything.lnk"
Return

#m:: ;打开 Minipad2
IfWinNotExist ahk_exe minipad2.exe
run "D:\Shortcuts\minipad2.lnk"
Else IfWinExist 
WinActivate
Return

#n::run "D:\Program Files\NotePad3\Notepad3\Notepad3.exe"

#k:: ;打开 KeePass
IfWinNotExist ahk_exe KeePass.exe
run "D:\Shortcuts\KeePass.lnk"
Else IfWinExist 
WinActivate
Return

; ===========keepass===========
#IfWinActive ahk_exe KeePass.exe
:*:``mm:: 
net = ThisismyKeePassPassWord ; 替换则符号里的加号要使用 {+}
clipboard = %net%  
Send {BackSpace 2}^v{Enter} ;Send之后使用回退键解决有时候地址栏第一个字母没有被替换的bug
Return
#IfWinActive

$^+a:: ;使用微信时用微信截图, 在Cent中使用浏览器自带截图, 其他情况使用系统自带截图
; $的使用参考 http://ahkcn.net/thread-816-post-10513.html#pid10513
IfWinActive, ahk_exe WeChat.exe
Send !a
else IFWinActive, ahk_exe Chrome.exe
Send ^+a
else
Send #+s
return


;使用MouseInc的窗口截图并保存
PrintScreen::^PrintScreen 

$F4:: ;使用 f4 打开 ocr，如果已经打开则开始使用ocr
; $的使用参考 http://ahkcn.net/thread-816-post-10513.html#pid10513
; DetectHiddenWindows的使用参考 https://www.zhihu.com/question/19645501/answer/14383561
DetectHiddenWindows, on 
IfWinNotExist ahk_exe 天若OCR文字识别.exe
Run "D:\Program Files\Tianruo OCR\天若OCR文字识别.exe"
Else
Send {F4}
Return
DetectHiddenWindows, Off
return

