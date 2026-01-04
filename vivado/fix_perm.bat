@REM @echo off

:loop
attrib -r .\*.* /s /d
timeout /t 5 /nobreak >nul
goto loop