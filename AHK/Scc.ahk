/*
	AHK-version：1.1.33.02
*/


;置顶激活窗口
CapsLock & 1:: Winset, Alwaysontop, , A

;文本替换，后者替换前者，需要按回车
::ack:: ccccc 

;循环点击
CapsLock & 2::
loop,100
{
	click
	;sleep 200
}
return

;发送按键
CapsLock & 3::
Send ack
return

!4::
run https://www.baidu.com
return


CapsLock & 4::
MouseGetPos, mouseX, mouseY
        ; 获得鼠标所在坐标，把鼠标的 X 坐标赋值给变量 mouseX ，同理 mouseY
PixelGetColor, color, %mouseX%, %mouseY%, RGB
        ; 调用 PixelGetColor 函数，获得鼠标所在坐标的 RGB 值，并赋值给 color
StringRight color,color,6
        ; 截取 color（第二个 color） 右边的 6 个字符，因为获得的值是这样的：#RRGGBB，一般我们只需要 RRGGBB 部分。把截取到的值再赋给 color（第一个 color）。
clipboard = %color%
        ; 把 color 的值发送到剪贴板
Msgbox Color get!
return

;输出当前时间
CapsLock & 5::
Send %A_YYYY%/%A_MM%/%A_DD%/%A_Hour%:%A_Min%:%A_Sec%
