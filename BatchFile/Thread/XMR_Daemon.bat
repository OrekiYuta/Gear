@echo off
title XMR_Daemon
echo. Process Checking...
ping 127.1 -n 3 > nul

set forN = 0

:start
set /a forN += 1
echo %forN%
tasklist /fi "windowtitle eq XMRig 6.12.0" | find "cmd"

if %forN% equ 3 goto end
if "%errorlevel%" =="0" (goto exist) else (goto unexist)

echo %forN%
:exist
echo. Process exist . do nothing.
goto start

:unexist
echo. Process unexist . restart XMR
start /D "C:\Users\OrekiYuta\Desktop\monero\xmrig-6.12.0" start.cmd
ping 127.1 -n 5 > nul
goto start


:end
echo. XMR_Daemon exit