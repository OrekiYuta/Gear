@echo off
title Add carriage return at the end of the text
(for /f "delims=" %%a in (before.txt) do echo %%a && echo.)>after.txt
del /s/q before.txt
ren after.txt before.txt
@REM msg * "complete" 
