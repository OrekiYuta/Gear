
@REM 后续命令使用的是：UTF-8编码
chcp 65001

@REM Run at Nas(192.168.1.12)
ping localhost -n 60

@REM 192.168.1.100 origin vmware
call "C:\Program Files (x86)\VMware\VMware Workstation\vmrun.exe" -T ws start "F:\Elias_VM\Virtual Machines\VMware Photon 64 位\VMware Photon 64 位.vmx" gui

