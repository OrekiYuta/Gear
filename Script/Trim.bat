﻿@echo off&setlocal enabledelayedexpansion
for /f "delims=" %%i in ('dir /s/b *.*') do (
    set "foo=%%~nxi"
    set foo=!foo: =!
    set foo=!foo: =!
    ren "%%~fi" "!foo!"
)
echo Well done！
timeout /t 3 /nobreak
pause