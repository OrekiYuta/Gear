@echo off
@title bat auto git commit and push
call D:
call cd D:\Github\Temp
call git add .
call git commit -m "%date:~6,4%-%date:~0,2%-%date:~3,2%/%time% by auto commit from magicbook"
call git pull
call git push
timeout /t 3 /nobreak
