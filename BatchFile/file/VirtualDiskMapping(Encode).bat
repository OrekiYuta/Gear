@echo off
set inputTimes=3
echo.
echo Notice:Three opportunities.
echo.

:checkPw
set /p password=Input password£º
if \"%password%\"==\"123\" goto o

set /a inputTimes-=1
if \"%inputTimes%\"==\"0\" cls&echo.&echo =<Passenger no entry>!!!=&echo.&pause&echo.&exit

cls&echo.&echo There are %inputTimes% opportunities left&echo.&goto checkPw

:o
cls&echo.
echo= Welcome!!! =
md H:\RECYCLED\UDrives.{25336920-03F9-11CF-8FD0-00AA00686F13}>NUL
if exist M:\NUL goto delete
subst M: H:\RECYCLED\UDrives.{25336920-03F9-11CF-8FD0-00AA00686F13}
start M:\
goto end
:delete
subst /D M:
:end
