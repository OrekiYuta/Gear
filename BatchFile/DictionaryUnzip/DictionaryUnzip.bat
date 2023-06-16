@echo off
echo 使用前请把您的字典放进该文件夹并修改字典名为DictionaryKey
set /p package=把您压缩包拖进来:
set packagetirm="package=%package: =%"
for %%i in ("%packagetirm%") do set flodername=%%~ni
for %%i in ("%packagetirm%") do set floderpath=%%~dpi
echo 解压后文件名:%flodername%
echo 解压后文件路径:%floderpath%
::set /p type=压缩包格式为(zip,rar,7z...):
for /f %%a in (DictionaryKey.txt) do bin\HaoZipC.exe e -tzip %package% -p%%a -o"%floderpath%%flodername%"  
pause