
@echo off&setlocal enabledelayedexpansion&cls&color 0f&title Welcome to CN-DOS! 
mode con: cols=30 lines=3 
set "a= PC-X69" 
set b= 
set "c=12345689abcde" 
echo\ 
:c 
for /l %%a in (6,1,28) do ( 
set /a d=%random%%%13+1 
call :pp %%a 
) 
goto c 
:pp 
set/p=!a:~-%1!<nul 
set/p=!b:~0,%1!<nul 
color 0!c:~%d%,1! 
goto :eof
