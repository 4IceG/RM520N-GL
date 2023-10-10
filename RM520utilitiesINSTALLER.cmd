@echo off

REM Check if running as Administrator; request elevation if not
>nul 2>&1 net session || (
  echo Requesting administrative privileges...
  powershell -Command "Start-Process '%~0' -Verb RunAs"
  exit /b
)

REM Set the working directory to the location of the .cmd file
cd /d "%~dp0"

REM Ask the user if they want to install Quectel NDIS Driver V2.4.6
echo Do you want to install Quectel NDIS Driver V2.4.6 (y/n):
set /p answer=

if "%answer%"=="y" (
  REM Create directory C:\Quectel
  mkdir C:\Quectel

  REM Extract Quectel NDIS Driver V2.4.6
  powershell -Command "Expand-Archive -Force '%~dp0\Toolz\Quectel_Windows_USB_DriverQ_NDIS_V2.4.6.zip' 'C:\Quectel\'"

  REM Execute setup.exe and wait for it to close
  powershell -Command "Start-Process 'C:\Quectel\setup.exe'"

  REM Display "Waiting for the driver installer to finish..."
  echo Install the drivers and then continue...
  pause
)

REM Ask the user if they want to install Qflash
echo Do you want to install Qflash (y/n):
set /p answer=

if "%answer%"=="y" (
  REM Create directory C:\Quectel\firmware
  mkdir C:\Quectel\firmware

  REM Create directory C:\Quectel\flash
  mkdir C:\Quectel\flash

  REM Extract Qflash
  powershell -Command "Expand-Archive -Force '%~dp0\Toolz\QFlash_V6.4.zip' 'C:\Quectel\'"

  REM Create a traditional shortcut to QFlash 6.4 on the desktop with the proper working directory
  powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('C:\Users\Public\Desktop\QFlash 6.4.lnk'); $s.TargetPath = 'C:\Quectel\QFlash_V6.4\QFlash_V6.4.exe'; $s.WorkingDirectory = 'C:\Quectel\QFlash_V6.4'; $s.Save()"

  REM Create a traditional shortcut to QFlash 6.4 in the Start Menu with the proper working directory
  powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\QFlash 6.4.lnk'); $s.TargetPath = 'C:\Quectel\QFlash_V6.4\QFlash_V6.4.exe'; $s.WorkingDirectory = 'C:\Quectel\QFlash_V6.4'; $s.Save()"
)

REM Ask the user if they want to add a copy of the RM520 firmware(s) included in iamromulan's resource package to their C:\Quectel\firmware folder
echo Do you want to add a copy of the RM520 firmware(s) included in iamromulan's resource package to your C:\Quectel\firmware folder? (y/n):
set /p answer=

if "%answer%"=="y" (
  REM Merge the "Firmware" directory with C:\Quectel\firmware
  robocopy "Firmware" "C:\Quectel\firmware" /MIR
)

REM Ask the user if they want to install Qnavigator
echo Do you want to install Qnavigator (y/n):
set /p answer=

if "%answer%"=="y" (
  REM Extract Qnavigator
  powershell -Command "Expand-Archive -Force '%~dp0\Toolz\Qnavigator_V1.6.10.zip' 'C:\Quectel\'"

  REM Create a traditional shortcut to QNavigator 1.6.10 on the desktop with the proper working directory
  powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('C:\Users\Public\Desktop\QNavigator 1.6.10.lnk'); $s.TargetPath = 'C:\Quectel\Qnavigator_V1.6.10\Qnavigator.exe'; $s.WorkingDirectory = 'C:\Quectel\Qnavigator_V1.6.10'; $s.Save()"

  REM Create a traditional shortcut to QNavigator 1.6.10 in the Start Menu with the proper working directory
  powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\QNavigator 1.6.10.lnk'); $s.TargetPath = 'C:\Quectel\Qnavigator_V1.6.10\Qnavigator.exe'; $s.WorkingDirectory = 'C:\Quectel\Qnavigator_V1.6.10'; $s.Save()"
)

REM Display "End of installer press enter to close this window"
echo End of installer press enter to close this window
pause