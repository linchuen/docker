@ECHO off
cd /d "%~dp0"
echo %CD%
call cmd /c "docker compose up"
exit