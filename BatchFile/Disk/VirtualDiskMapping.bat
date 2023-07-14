@echo off
goto start
在物理盘符下创建文件夹
如果存在虚拟盘符就执行删除盘符映射关系
创建虚拟盘符并映射到物理盘符的文件夹
打开虚拟盘符
:start

md H:\RECYCLED\UDrives.{25336920-03F9-11CF-8FD0-00AA00686F13}>NUL
if exist M:\NUL goto delete
subst M: H:\RECYCLED\UDrives.{25336920-03F9-11CF-8FD0-00AA00686F13}
start M:\
goto end
:delete
subst /D M:
:end