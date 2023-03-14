@echo off
title Eth_Daemon
echo. Process Checking...

@REM tasklist /fi "imagename eq cmd.exe" /fi "windowtitle eq ethminer.exe" 
@REM tasklist /fi "windowtitle eq 管理员:  ethminer.exe" | findStr "cmd"

@REM echo %errorlevel%
@REM if "%errorlevel%" =="0" (goto exist) else (goto unexist)


netstat -an | find /C "13333" > temp.txt 
set /p num=<temp.txt
del /F temp.txt
if %num% == 0 (goto unexist) else (goto exist)

:exist
echo. Process exist . do nothing.
goto end

:unexist
echo. Process unexist . restart ethminer
start /D "C:\Users\OrekiYuta\Desktop\sparkpool\bin" start.bat
goto end

:end
echo. Eth_Daemon exit
