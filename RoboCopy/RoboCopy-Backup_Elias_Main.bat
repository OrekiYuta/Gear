robocopy "G:\Elias_Main" "\\192.168.1.5\eliasSave\Elias_Main" /mt:12 /mir /ts /r:3 /w:5 /log+:"X:\Elias_Z_MoveToThis_Log\%date:~0,4%-%date:~5,2%-%date:~8,2%-Backup-Elias_Main.txt"
