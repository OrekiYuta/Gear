@echo off
setlocal enabledelayedexpansion

@REM Format date and time as file name prefix
set "timestamp=%date:~0,4%-%date:~5,2%-%date:~8,2%"
@REM echo %timestamp%

@REM Traverse the mov and mp4 files in the current directory
for %%f in (*.mov *.mp4) do (
    @REM Splice new file names
    set "newname=%timestamp%_%%f"
    echo from "%%f" to "!newname!"

    @REM Perform rename operation
    ren "%%f" "!newname!"
)

endlocal
