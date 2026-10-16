@echo off

setlocal enabledelayedexpansion

cd %~dp0

echo ProGuardDeobfuscator v4.4
echo.

if "%1" == "" (
	echo Usage: %~n0 ^<jarfile^>
	echo 	where jarfile - jar file to be deobfuscated.
	echo.
	
	pause
	
	goto :eof
)	

echo Processing file %~nx1...

set SCRIPTFILE=proguard.pro
set OUTFOLDER=%~n1

if not exist %OUTFOLDER% mkdir %OUTFOLDER%

for %%F in (lib\*.jar) do (
	if "!LIBJARS!" NEQ "" set LIBJARS=!LIBJARS!;
	set LIBJARS=!LIBJARS!%%F
)

echo -libraryjars %LIBJARS% > %SCRIPTFILE%
echo -injars %~nx1 >> %SCRIPTFILE%
echo -outjar %OUTFOLDER%\%~nx1 >> %SCRIPTFILE%
echo -keep public class * extends javax.microedition.midlet.MIDlet >> %SCRIPTFILE%
echo -dontoptimize >> %SCRIPTFILE%
echo -dontshrink >> %SCRIPTFILE%
echo -dontusemixedcaseclassnames >> %SCRIPTFILE%
echo -microedition >> %SCRIPTFILE%
echo -printmapping %OUTFOLDER%\%~n1.txt >> %SCRIPTFILE%
echo -ignorewarnings >> %SCRIPTFILE%
echo -verbose >> %SCRIPTFILE%

java -jar proguard.jar @%SCRIPTFILE% > %OUTFOLDER%\%~n1.log 2>&1

echo finished
echo.

pause

del /q %SCRIPTFILE%