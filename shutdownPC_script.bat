@echo off

set /p hours="Enter hours: "
set /p minutes="Enter minutes: "
set /p seconds="Enter seconds: "

if "%hours%"=="" if "%minutes%"=="" if "%seconds%"=="" goto cancel

if "%hours%"=="" set hours=0
if "%minutes%"=="" set minutes=0
if "%seconds%"=="" set seconds=0

for /f "delims=0123456789" %%i in ("%hours%%minutes%%seconds%") do (
    if not "%%i"=="" (
        echo Invalid input. Please enter numbers only.
        goto start
    )
)

set /a total_seconds=(%hours% * 3600) + (%minutes% * 60) + %seconds%

echo System will shutdown in %hours% hours, %minutes% minutes, and %seconds% seconds.

shutdown /a >nul 2>&1

choice /m "Press Y to confirm shutdown timer, or N to cancel"
if errorlevel 2 goto cancel

shutdown /s /t %total_seconds%
goto end

:cancel
shutdown /a
echo Shutdown timer cancelled.

:end