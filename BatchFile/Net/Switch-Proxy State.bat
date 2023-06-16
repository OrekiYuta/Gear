@echo off
title  Switch Proxy State
color 0a
echo ========== Current Proxy ==========
echo.
set  proxyhost=http://127.0.0.1:8080
echo %proxyhost%
echo.
::echo ===================================
::echo.
::set /p changehost=Input a new proxy?(1/0):
::echo.
::
::if %changehost%==1 goto change
::if %changehost%==0 goto start
::
:::change
::echo ===================================
::echo.
::set /p proxyhost=Please input you new proxy
::echo Now,proxy is :%proxyhost%
::echo.
::

:start 
echo ============= Enable/Disable Proxy ==========
echo.
set /p switch=enable/disable (1/0):
echo.
if %switch%==1 goto enable
if %switch%==0 goto disable
echo.
goto done

:enable
echo =========== Enable Proxy ===========
echo.
>nul reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "%proxyhost%" /f
goto done

:disable
echo =========== Disalbe Proxy ===========
echo.
>nul reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "" /f

:done
echo.
echo ============= Well done =============
echo.
echo ===========3s later will close this windows============
timeout /t 3 /nobreak