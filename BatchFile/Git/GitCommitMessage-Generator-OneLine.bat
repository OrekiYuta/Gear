@ECHO off
@ECHO=
setlocal,EnableDelayedExpansion
@ECHO=


::////////////////////////////////////////////////////////////////////////////////////////////////
:: if modify need todo as follow
:: 1.set the array value 
:: 2.adjust loop max size

set obj_name[0]=feat
set obj_desc[0]=A new feature

set obj_name[1]=fix
set obj_desc[1]=A bug fix

set obj_name[2]=docs
set obj_desc[2]=Documentation only changes

set obj_name[3]=style
set obj_desc[3]=Changes that do not affect the meaning of the code( white-space, formatting, missing semi-colons, etc)

set obj_name[4]=refactor
set obj_desc[4]=A code change that neither fixes a bug nor adds a feature

set obj_name[5]=perf
set obj_desc[5]=A code change that improves performance

set obj_name[6]=test
set obj_desc[6]=Adding missing tests or correcting existing tests

set obj_name[7]=build
set obj_desc[7]=Changes that affect the build system or external dependencies( example scopes: gulp, broccoli, npm)

set obj_name[8]=ci
set obj_desc[8]=Changes to our configuration files and scripts( example scopes: Travis, Circle, BrowserStack, SauceLabs)

set obj_name[9]=chore
set obj_desc[9]=Other changes that don't modify src or test files

set obj_name[10]=revert
set obj_desc[10]=Reverts a previous commit


::////////////////////////////////////////////////////////////////////////////////////////////////

@ECHO OneLine Git Commit Standard Message.
for /l %%n in (0,1,10) do (
    echo %%n.   !obj_name[%%n]!     -!obj_desc[%%n]!
)

@REM (
@REM @ECHO OneLine Git Commit Standard Message.
@REM @ECHO 0.  !obj_name[0]!    - !obj_desc[0]!  
@REM @ECHO 1.  !obj_name[1]!    - !obj_desc[1]!  
@REM @ECHO 2.  !obj_name[2]!    - !obj_desc[2]!  
@REM @ECHO 3.  !obj_name[3]!    - !obj_desc[3]!  
@REM @ECHO 4.  !obj_name[4]!    - !obj_desc[4]!  
@REM @ECHO 5.  !obj_name[5]!    - !obj_desc[5]!  
@REM @ECHO 6.  !obj_name[6]!    - !obj_desc[6]!  
@REM @ECHO 7.  !obj_name[7]!    - !obj_desc[7]!  
@REM @ECHO 8.  !obj_name[8]!    - !obj_desc[8]!  
@REM @ECHO 9. !obj_name[9]!    - !obj_desc[9]!  
@REM @ECHO 10. !obj_name[10]!   - !obj_desc[10]! 
@REM )



:Method_Type
@ECHO=
@ECHO=
@ECHO **********    Set Type/Scope/Subject    ******************
@ECHO=
@ECHO git commit template is ^<type^>(^<scope^>): ^<subject^>
@ECHO=
set /p Var_SeqNo=Set Type: pls select your commit type (0~10):
@REM @ECHO=

@REM IF /i "!Var_SeqNo!"=="0" Call :Method_Scope feat  
@REM IF /i "!Var_SeqNo!"=="1" Call :Method_Scope fix
@REM IF /i "!Var_SeqNo!"=="2" Call :Method_Scope docs
@REM IF /i "!Var_SeqNo!"=="3" Call :Method_Scope style
@REM IF /i "!Var_SeqNo!"=="4" Call :Method_Scope refactor
@REM IF /i "!Var_SeqNo!"=="5" Call :Method_Scope perf
@REM IF /i "!Var_SeqNo!"=="6" Call :Method_Scope test 
@REM IF /i "!Var_SeqNo!"=="7" Call :Method_Scope build 
@REM IF /i "!Var_SeqNo!"=="8" Call :Method_Scope ci
@REM IF /i "!Var_SeqNo!"=="9" Call :Method_Scope chore
@REM IF /i "!Var_SeqNo!"=="10" Call :Method_Scope revert
    
for /l %%n in (0,1,10) do (
    IF /i !Var_SeqNo! equ %%n Call :Method_Scope  !obj_name[%%n]! 
)


@ECHO invalid input select SeqNo !VarSeqNo! , re input.
Call :Method_Type


:Method_Scope
@ECHO Set Type = %~1
@REM @ECHO git commit template is %~1(^<scope^>): ^<subject^>
set /p Var_Scope=Set Scope: pls input ^<scope^> value:
@REM @ECHO Now git commit message is %~1(!Var_Scope!): ^<subject^>
@REM @ECHO=
Call :Method_Subject %~1 , !Var_Scope!


:Method_Subject
@ECHO Set Scope = %~2
set /p Var_Subject=Set Subject: pls input ^<subject^> value:
@REM @ECHO Now git commit message is %~1(%~2): !Var_Subject!
@REM @ECHO=
Call :End %~1 , %~2 , !Var_Subject!


:End
@ECHO Set Subject = %~3
@ECHO=
@ECHO=
@ECHO **********    Output    *******************************
@ECHO %~1(%~2): %~3 |clip
@ECHO %~1(%~2): %~3 
@ECHO=
@ECHO output have set to clip , your can paste anywhere.
@ECHO or your also can select it and copy above echo.
pause&exit

