@echo off

set    zip=squaitsa.zip
set ifiles=sq5.3.9e+sq6.4.9f+sq7.5.9j+sq5.3.9e+sq6.4.9f+sq7.5.9j+sq5.3.9e+sq6.4.9f+sq2.1.1e+sq1.1c+sq4.2.1j+sq3.1f+mmi6331.3p+mmi6331.3
set  ofile=a.squash.rom

rem =====================================
setlocal ENABLEDELAYEDEXPANSION

set pwd=%~dp0
echo.
echo.

if EXIST %zip% (

	!pwd!7za x -otmp %zip%
	if !ERRORLEVEL! EQU 0 ( 
		cd tmp

		copy /b/y %ifiles% !pwd!%ofile%
		if !ERRORLEVEL! EQU 0 ( 
			echo.
			echo ** done **
			echo.
			echo Copy "%ofile%" into root of SD card
		)
		cd !pwd!
		rmdir /s /q tmp
	)

) else (

	echo Error: Cannot find "%zip%" file
	echo.
	echo Put "%zip%", "7za.exe" and "%~nx0" into the same directory
)

echo.
echo.
pause
