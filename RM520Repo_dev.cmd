@echo off

REM Check if running as Administrator; request elevation if not
>nul 2>&1 net session || (
  echo Requesting administrative privileges...
  powershell -Command "Start-Process '%~0' -Verb RunAs"
  exit /b
)

REM Set the working directory to the location of the .cmd file
cd /d "%~dp0"

:menu
cls
echo Welcome to the RM520N-GL Repo tool kit!
echo Please select an option:
echo 1) Install Quectel NDIS Driver V2.4.6
echo 2) Install Qflash
echo 3) Get RM520N-GL firmware
echo 4) Install Qnavigator
echo 5) Exit
echo.
set /p choice=Please select a choice: 

if "%choice%"=="1" goto install_ndis
if "%choice%"=="2" goto install_qflash
if "%choice%"=="3" goto get_firmware
if "%choice%"=="4" goto install_qnavigator
if "%choice%"=="5" goto end_script
goto menu

:install_ndis
echo Opening driver setup...
mkdir C:\Quectel
powershell -Command "Expand-Archive -Force '%~dp0\Toolz\Quectel_Windows_USB_DriverQ_NDIS_V2.4.6.zip' 'C:\Quectel\'"
powershell -Command "Start-Process 'C:\Quectel\setup.exe'"
echo Install the drivers and then continue...
pause
goto menu

:install_qflash
echo Installing Qflash...
mkdir C:\Quectel\firmware
mkdir C:\Quectel\flash
powershell -Command "Expand-Archive -Force '%~dp0\Toolz\QFlash_V6.4.zip' 'C:\Quectel\'"
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('C:\Users\Public\Desktop\QFlash 6.4.lnk'); $s.TargetPath = 'C:\Quectel\QFlash_V6.4\QFlash_V6.4.exe'; $s.WorkingDirectory = 'C:\Quectel\QFlash_V6.4'; $s.Save()"
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\QFlash 6.4.lnk'); $s.TargetPath = 'C:\Quectel\QFlash_V6.4\QFlash_V6.4.exe'; $s.WorkingDirectory = 'C:\Quectel\QFlash_V6.4'; $s.Save()"
echo Qflash Installed!  
goto menu

:get_firmware
robocopy "Firmware" "C:\Quectel\firmware" /MIR
goto menu

:install_qnavigator
powershell -Command "Expand-Archive -Force '%~dp0\Toolz\Qnavigator_V1.6.10.zip' 'C:\Quectel\'"
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('C:\Users\Public\Desktop\QNavigator 1.6.10.lnk'); $s.TargetPath = 'C:\Quectel\Qnavigator_V1.6.10\Qnavigator.exe'; $s.WorkingDirectory = 'C:\Quectel\Qnavigator_V1.6.10'; $s.Save()"
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\QNavigator 1.6.10.lnk'); $s.TargetPath = 'C:\Quectel\Qnavigator_V1.6.10\Qnavigator.exe'; $s.WorkingDirectory = 'C:\Quectel\Qnavigator_V1.6.10'; $s.Save()"
goto menu

:end_script
echo Exiting the repo kit...
pause
exit /b
