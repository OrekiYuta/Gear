
@echo off
color 0a

%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
echo ========================== Switch Auto/Static IP ====================
set /p str=IP address automatically/Static IP address[192.168.137.12] (1/0)
if %str%==1 goto A
if %str%==0 goto B
goto done

:A
echo ============= To:   address automatically ===========================
netsh interface ip set address name="bmcc" source=dhcp
ping -n 1 127.0.0.1>nul
ipconfig
goto done

:B
echo ============= To:   Static IP address(192.168.137.12) ===============
netsh interface ip set address name="bmcc" source=static addr=192.168.137.12 mask=255.255.255.0 
ping -n 5 127.0.0.1>nul
ipconfig 
ping 192.168.137.245
goto done

:done
echo =========================== Well done ===============================
timeout /t 5 /nobreak
