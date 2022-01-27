; #Warn  ; Enable warnings to detect common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force  ;脚本正在运行时, 启动该脚本时会跳过对话框并自动替换旧实例.
; #NoTrayIcon  ;不显示托盘图标

;==========CapsLock打开listary============================

;+CapsLock::CapsLock ;Shift+capslock 映射为CapsLock
;CapsLock::!Space  ;capslock 映射成 Listary 激活键
;~LWin::Send {Bind}{vk07} ;禁用单独 Win 键


; =====================================脚本的修改===================================
#a:: ;用于使用Notepad3修改脚本, 保存后,运行(ctrl+L)即可
run "E:\TotalCMD\Tools\Notepad3.exe" %A_ScriptFullPath%
return


;================关于快捷键的帮助=============================
; 修饰符 win #, shift +, ctrl ^, alt !, 
; ~: 原有的功能不会被屏蔽 , 
; $: 脚本使用 Send 命令发送包含了热键自身的按键时需要使用此符号 
; ==============快速替换文本的帮助===================
; * 不需要终止符; ? 可以包含在其他单词中; c区分大小写
; 0 用以关闭某个功能,比如 ?0 表示否定包含在其他单词中
; o 删除之后的终止符,不用退格等等; 
;=========================================================


;===================================程序快捷键=====================================

#f:: ;打开 Everything
IfWinExist "Everything"
WinActivate
else
run "D:\Program Files\Everything\Everything.exe"
Return


;#m:: ;打开 Minipad2
;IfWinNotExist ahk_exe minipad2.exe
;run "D:\Shortcuts\minipad2.lnk"
;Else IfWinExist 
;WinActivate
;Return

;#n:: ;打开 Notepad3
;run "D:\Program Files\TotalCMD\Tools\Notepad3.exe"
;Return

;#+e:: ;重启文件资源管理器, Win10 LTSC 修复该bug
;Process, Close, explorer.exe
;run explorer.exe
;Return

;#o:: ;用 win+o 打开 ocr，如果已经打开则重启 ocr
; DetectHiddenWindows的使用参考 https://www.zhihu.com/question/19645501/answer/14383561
;DetectHiddenWindows, on 
;IfWinNotExist ahk_exe 天若OCR文字识别.exe
;Run "D:\Shortcuts\天若OCR文字识别.lnk"
;Else
;Process, Close, 天若OCR文字识别.exe ; close ocr
;run "D:\Shortcuts\天若OCR文字识别.lnk" ;re-open it
;DetectHiddenWindows, Off
;Return

; ========================keepass===========================
#k:: ;打开 KeePass
IfWinNotExist ahk_exe KeePass.exe
run "D:\Shortcuts\KeePass.lnk"
Else IfWinExist 
WinActivate
Return

; KeePass 已更换简单密码
;#IfWinActive ahk_exe KeePass.exe ;for Keepass 密码
;:*:``mm:: 
;net = password ;替换则符号里的加号要使用 {+}
;clipboard = %net%  
;Send {BackSpace 2}^v{Enter} 
;Return
;#IfWinActive


;============================LaTeX
#IfWinActive ahk_exe SiYuan.exe
; 常用符号 
:?*:=>::\implies{Space} ;隐含
:?*:->::\to{Space} ;→
:?*:>=::\geq{Space} ;大于等于
:?*:<=::\leq{Space} ;小于等于
:?*:~~::\approx
:?*:\frac::\frac{{}*{}}{{}{}}{left 3}+{Left} ;除号
;:?*:\mod::\equiv * \pmod *{Left 8}+{Left} ;同余
:?*:\{::\{{}*\{}}{Left 2}+{Left}  ;补全大括号
:?*:\(::\left(*\right){Left 7}+{Left} ;补全小括号
;:?*:[[::[\{!}[]\{!}]{Left 4} ;双中括号
:?*:0/::\varnothing
 
:o:su::\sum{Space} ; \sum
:o:sum::\sum_{{}•{}}{^}{{}•{}}{Left 5}+{Left} ; \sum_{•}^{•}
:o:prod::\prod_{{}•{}}{^}{{}•{}}{Left 5}+{Left} ; \prod_{•}^{•}
;:o:in::\int{Space} ; \int
:o:oin::\oint{Space} ; \oint
:o:int::\int_{{}•{}}{^}{{}•{}}{Left 5}+{Left} ; \int_{•}^{•}
:o:sq::\sqrt{{}•{}}{Left}+{Left} ; \sqrt{ } \sqrt{}
:o:inf::\infty

; 数学字体
:*:\cal::\mathcal{{}•{}}{Left}+{Left}
:*:\bb::\mathbb{{}•{}}{Left}+{Left}
:*:\frak::\mathfrak{{}•{}}{Left}+{Left}

; 数学记号
:*:\aend::\mathrm{{}End{}}

; 希腊字母 `双写`
:*:aa::\alpha
:*:bb::\beta
:*:ee::\epsilon
:*:dd::\delta
:*:ll::\lambda
:*:ff::\phi
:*:vff::\varphi
:*:oo::\omega
:*:\gg::\gamma
:*:\ss::\sigma
:*:\gth::\theta
:*:\kk::\kappa
#IfWinActive

;===================在编辑器内的特定符号自动替换和自动输入==================
; 邮箱替代
:*:@yeah::whzecomjm@yeah.net


; 输出签名和当前时间, 秒的参数 %A_Sec%
:*:@wend:: 
Send,whzecomjm{Shift}+{Enter}%A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%`n
return
