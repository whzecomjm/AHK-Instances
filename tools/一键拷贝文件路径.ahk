#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;---------------------一键拷贝文件路径 Ctrl+Shift+c ---------------------
; 该功能已被Listary和 TC 的功能替换
^+c::
; null= 
send ^c
sleep,200
clipboard=%clipboard% ;%null%
tooltip,%clipboard%
sleep,500
tooltip,
return

;[Win] + Z ;一键拷贝文件路径 ;
#z::
clipboard := % Explorer_GetSelection(hwnd) ;调用了函数
Tooltip,%clipboard%	;在鼠标右侧显示【拷贝的文件路径】
Sleep,800
Tooltip,
return