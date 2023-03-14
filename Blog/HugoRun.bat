@echo off
color 0a
cd %CD%

echo hugo.exe | cmd.exe

start explorer.exe open=http://localhost:1313

echo hugo.exe server | cmd.exe

::ping -n 3 127.0.0.1
::%1(start /min cmd.exe /c %0 :&exit)

pause
