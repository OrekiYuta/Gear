@echo off
@title bat auto git commit and push
call F:
call cd F:\Code\MyGitHub\orekiyuta.github.io
call git add .
call git commit -m "Auto Backup at %date:~0,4%-%date:~5,2%-%date:~8,2%/%time%"
call git push
timeout /t 3 /nobreak
