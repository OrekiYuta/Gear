@echo off & setlocal enabledelayedexpansion & color 0a & chcp 437 & title CMD 3D

if "%1"=="" (
	for %%a in (  FontSize:00080008		FontFamily:00000030		WindowSize:00560055
				  ScreenColors:0000000f		CodePage:000001b5		ScreenBufferSize:00560055
	) do for /f "tokens=1,2 delims=:" %%b in ("%%a") do (
		>nul reg add HKCU\Console\3D_ROTATE /v %%b /t reg_dword /d 0x%%c /f
	)

	start "3D_ROTATE" /max "%ComSpec%" /c "%~s0" 1&goto:eof
) else (
	>nul reg delete HKCU\Console\3D_ROTATE /f
)

set "SIN=(A-A*A/1875*A/320000+A*A/1875*A/15625*A/16000*A/2560000-A*A/1875*A/15360*A/15625*A/15625*A/16000*A/44800000)"
set "COS=(10000-A*A/20000+A*A/1875*A/15625*A/819200-A*A/1875*A/15360*A/15625*A/15625*A/10240000+A*A/1875*A/15360*A/15625*A/15625*A/16000*A/15625*A/229376000)"
set /a "ZM=10000, p=31416, p2=62832, pn2=-62832, p#2=15708, p3#2=47124, p3#2_=p3#2-1, DEG=31416/180"

set "DOT=?
for %%a in ( "######  ###### "
	         "     ## ##   ##"
	         "  ####  ##   ##"
	         "     ## ##   ##"
	         "     ## ##   ##"
	         "######  ###### "   ) do (
	set "s1=!s1!%%~a="
)
set "s1=!s1:#=%DOT%!"

set "t=" & set /a "x=0,y=0,pcnt=0"
for /l %%a in (0 1 300) do (
	if "!s1:~%%a,1!" equ "%DOT%" (
		set /a "pcnt+=1"
		set /a "xs!pcnt!=(x-7)*3,ys!pcnt!=(y-3)*3"
	)

	if "!s1:~%%a,1!" equ "=" (set /a "y+=1,x=0") else (set /a "x+=1")
)

set /a "wid=0X55, Cols=wid, lines=wid+1, iMax=wid*wid"
MODE !Cols!,!lines!

for /l %%i in (1 1 !iMax!) do set "scr= !scr!"
set "emp=!scr!"

set /a "th=0, XC = Cols/2, YC = lines/2, zscr = 30, zeye = 200, zs = zscr, u = 6, v = 8, w = 0"
for /l %%a in () do (
	set /a "th+=p2+10*DEG, th %%= p2, th += th>>31&p2, t=th, s1=(t-p#2^t-p3#2)>>31, s3=p3#2_-t>>31, t=(-t&s1)+(t&~s1)+(p&s1)+(pn2&s3), SINt=%SIN:A=t%, t=%COS:A=t%, COSt=(-t&s1)+(t&~s1)"

	for /l %%i in (1 1 !pcnt!) do (
		set /a "zs2e=zscr-zeye,uxvywz=u*xs%%i+v*ys%%i+w*zs,v_1_COSt=ZM-COSt,uvwM1_COSt=uxvywz*v_1_COSt,z_t2eye_ZM=(w*uvwM1_COSt/100+zs*COSt+(-v*xs%%i+w*ys%%i)*SINt/10)-zeye*ZM, x=XC + (u*uvwM1_COSt/100 + xs%%i*COSt + (-w*ys%%i + v*zs)*SINt/10)*zs2e/z_t2eye_ZM, y=YC + (v*uvwM1_COSt/100 + ys%%i*COSt + (+w*xs%%i - u*zs)*SINt/10)*zs2e/z_t2eye_ZM, inScr=(x-0^x-wid)&(y-0^y-wid)"
		if !inScr! lss 0 (
			set /a "ind=x+y*wid+1, lenL=ind-1, lenR=iMax-ind"
			for /f "tokens=1,2,3" %%a in ("!lenL! !ind! !lenR!") do (set scr=!scr:~0,%%a!!DOT!!scr:~%%b,%%c!)
		)
	)

	cls &(<nul set /p=!scr:~0,-1!)
	set "scr=!emp!"
)