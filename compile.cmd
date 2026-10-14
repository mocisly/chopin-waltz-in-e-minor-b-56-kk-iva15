@echo off
setlocal
cd /d "%~dp0"
where lilypond >nul 2>nul
if errorlevel 1 (
  echo LilyPond was not found on PATH.
  pause
  exit /b 1
)
if not exist "build" mkdir "build"
lilypond -o "build\chopin-waltz-in-e-minor-b-56-kk-iva15" "chopin-waltz-in-e-minor-b-56-kk-iva15.ly" >"build\compile.log" 2>&1
set "rc=%errorlevel%"
type "build\compile.log"
if not "%rc%"=="0" (
  echo Compilation failed. See build\compile.log.
  pause
  exit /b %rc%
)
echo PDF and MIDI are in the build directory.
pause
endlocal
