@echo off
color 0a

start explorer.exe open=https://twitter.com/

ping -n 5 127.0.0.1

start explorer.exe open=https://www.youtube.com/

timeout /t 3 /nobreak

pause
