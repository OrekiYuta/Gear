@echo off
color 0a
::Switch admin 
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )

title Switch Ethernet State
echo ===========Current Ethernet===========
echo.
netsh interface show interface
echo ===========Switch Ethernet State=======
echo.
set ConName="ÒÔÌ«Íø"
netsh interface show interface "%ConName%" | findstr "ÒÑ½ûÓÃ" && (set State=enabled && echo  ===============Connect===============)|| (set State=disabled) && echo  ===============Disconnect===============
netsh interface set interface "%ConName%" %State%
echo ===========Well done=================
echo.
echo ===========Now,%ConName% State is %State%
echo.
echo ===========3s later will close this windows============
timeout /t 3 /nobreak
::@cmd.exe