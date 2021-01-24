@echo off
@title bat auto git commit and push
call F:
call cd F:/Code/Temp
call git add .
call git commit -m "%date:~0,4%-%date:~5,2%-%date:~8,2%/%time% by auto commit"
call git push
timeout /t 3 /nobreak
