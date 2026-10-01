@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
cd /d "%~dp0"

echo ===========================================
echo   Listing ALL files and folders in: %cd%
echo   (Excluding: Z9other folder)
echo ===========================================
echo.

REM Save to file first, then display
set output=filelist.txt

REM List all folders except Z9other
echo FOLDERS: > "%output%"
for /f "delims=" %%d in ('dir /ad /b /s 2^>nul ^| findstr /v /i "\\Z9other\\" ^| findstr /v /i "^Z9other$"') do (
    echo %%d
) >> "%output%"

echo. >> "%output%"

REM List all files except those in Z9other folder
echo FILES: >> "%output%"
for /f "delims=" %%f in ('dir /a-d /b /s 2^>nul ^| findstr /v /i "\\Z9other\\"') do (
    echo %%f
) >> "%output%"

REM Show the file
type "%output%"
echo.
echo Full list saved to: %output%
echo Note: Z9other folder and its contents have been excluded.
pause