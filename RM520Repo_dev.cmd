@echo off

REM Check if running as Administrator; request elevation if not
>nul 2>&1 net session || (
  echo Requesting administrative privileges...
  powershell -Command "Start-Process '%~0' -Verb RunAs"
  exit /b
)

REM Set the working directory to the location of the .cmd file
cd /d "%~dp0"

REM Check if Megatools directory already exists
if exist "%~dp0megatools\megatools-1.11.1.20230212-win64\" (
    echo Megatools directory already exists, skipping download and extraction.
    goto setpath
) else (
    REM Check if the Megatools ZIP file exists
    if exist "%~dp0megatools.zip" (
        echo Megatools ZIP file already exists, skipping download.
        goto extract_megatools
    )

    REM Download Megatools
    echo Megatools lets us download files on https://Mega.nz/ via command line!
    echo Downloading Megatools...
    powershell -Command "Invoke-WebRequest -Uri 'https://megatools.megous.com/builds/builds/megatools-1.11.1.20230212-win64.zip' -OutFile '%~dp0megatools.zip'"
)

:extract_megatools
REM Check if the download was successful or if ZIP file is present
if not exist "%~dp0\megatools.zip" (
    echo Error: Megatools ZIP file not found.
    exit /b
)

REM Extract Megatools
echo Extracting Megatools...
powershell -Command "Expand-Archive -Force '%~dp0\megatools.zip' '%~dp0\megatools'"

:setpath
REM Set up Megatools for use
set PATH=%PATH%;%~dp0\megatools\megatools-1.11.1.20230212-win64

REM Create the C:\Quectel directory
if not exist "C:\Quectel\" (
    echo Creating C:\Quectel directory...
    mkdir "C:\Quectel\"
)


REM Check if the download was successful
if not exist "%~dp0\megatools.zip" (
  echo Error: Failed to download Megatools.
  exit /b
)
goto menu
REM Main Menu
:menu
cls
echo Main Menu
echo Visit https://github.com/iamromulan/ for more
echo Please select an option:
echo 1) Install Drivers
echo 2) Install Qflash
echo 3) RM520N-GL AT command PDFs downloads
echo 4) RM520N-GL firmware downloads
echo 5) Install Qnavigator
echo 6) ADB setup
echo 7) Exit
echo.
set /p choice=Please select a choice: 

if "%choice%"=="1" goto install_drivers
if "%choice%"=="2" goto install_qflash
if "%choice%"=="3" goto get_atpdfs
if "%choice%"=="4" goto get_firmware
if "%choice%"=="5" goto install_qnavigator
if "%choice%"=="6" goto adb_setup
if "%choice%"=="7" goto end_script
goto menu

:install_drivers
cls
echo Driver Options:
echo 1) (Recommended)Install NDIS Driver (For usb mode: AT+QCFG="usbnet",0)
echo 2) Install MBIM Driver (For usb mode: AT+QCFG="usbnet",2)
echo 3) Install RNDIS Driver (For usb mode: AT+QCFG="usbnet",3)
echo 4) Main Menu
echo.
set /p driver_choice=Select a driver option: 

if "%driver_choice%"=="1" goto driver_option_1
if "%driver_choice%"=="2" goto driver_option_2
if "%driver_choice%"=="3" goto driver_option_3
if "%driver_choice%"=="4" goto menu
goto menu

:driver_option_1
echo Downloading and Running Installer for NDIS Driver...
megatools dl https://mega.nz/file/jFlnkIoC#2HSmvJTVQvcCjN8xYj6G2UxY91khYbLdvTF9NoXRGfQ
REM Extract Quectel NDIS Driver
powershell -Command "Expand-Archive -Force '%~dp0\Quectel_Windows_USB_DriverQ_NDIS_V2.4.6.zip' 'C:\Quectel\'"
REM Execute setup.exe and wait for it to close
powershell -Command "Start-Process 'C:\Quectel\NDISsetup.exe'"
del Quectel_Windows_USB_DriverQ_NDIS_V2.4.6.zip
goto Install_drivers

:driver_option_2
echo Downloading and Running Installer for MBIM Driver...
megatools dl https://mega.nz/file/XctiBLRQ#TPjrW5AKIcct9giF7aZlaxTwUM9Huwpa0mOls4xP5NE
REM Extract Quectel MBIM Driver
powershell -Command "Expand-Archive -Force '%~dp0\Quectel_Windows_USB_Driver(Q)_MBIM_V1.3.1.zip' 'C:\Quectel\'"
REM Execute setup.exe and wait for it to close
powershell -Command "Start-Process 'C:\Quectel\mbimsetup.exe'"
del Quectel_Windows_USB_Driver(Q)_MBIM_V1.3.1.zip
goto Install_drivers

:driver_option_3
echo Downloading and Running Installer for RNDIS Driver...
megatools dl https://mega.nz/file/Sclj0C5Q#EJ3xr60g99thcuyVav42bOjs-z_Iu-Qv3hYycrJAjbk
REM Extract Quectel NDIS Driver V2.4.6
powershell -Command "Expand-Archive -Force '%~dp0\Quectel_Windows_USB_Driver(Q)_RNDIS_V1.0.9.zip' 'C:\Quectel\'"
REM Execute setup.exe and wait for it to close
powershell -Command "Start-Process 'C:\Quectel\RNDISsetup.exe'"
del Quectel_Windows_USB_Driver(Q)_RNDIS_V1.0.9.zip
goto Install_drivers


:install_qflash
cls
echo Qflash Versions:
echo 1) 6.6 (Latest)
echo 2) 6.4
echo 3) Go back to Main Menu
echo.
set /p qflash_choice=Select a Qflash version: 

if "%qflash_choice%"=="1" goto qflash_v6.6
if "%qflash_choice%"=="2" goto qflash_v6.4
if "%qflash_choice%"=="3" goto menu
goto menu

:qflash_v6.6
REM Create directory C:\Quectel\flash
mkdir C:\Quectel\flash
megatools dl https://mega.nz/file/Lc8E3BLB#RoYzTEdk1TS3EKC_REEPQ18MrNo5c5BFQ7iT18Bx-A4
REM Extract and install Qflash
powershell -Command "Expand-Archive -Force '%~dp0\QFlash_V6.6_EN.zip' 'C:\Quectel\'"
REM Create a traditional shortcut to QFlash 6.6 on the desktop with the proper working directory
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('C:\Users\Public\Desktop\QFlash 6.6.lnk'); $s.TargetPath = 'C:\Quectel\QFlash_V6.6\QFlash_V6.6.exe'; $s.WorkingDirectory = 'C:\Quectel\QFlash_V6.6'; $s.Save()"
REM Create a traditional shortcut to QFlash 6.6 in the Start Menu with the proper working directory
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\QFlash 6.6.lnk'); $s.TargetPath = 'C:\Quectel\QFlash_V6.6\QFlash_V6.6.exe'; $s.WorkingDirectory = 'C:\Quectel\QFlash_V6.6'; $s.Save()"
del QFlash_V6.6_EN.zip
goto menu

:qflash_v6.4
REM Create directory C:\Quectel\flash
mkdir C:\Quectel\flash
megatools dl https://mega.nz/file/PEFT1A5Z#uGUNnpcKtKwmd_lw8POnY51Jr2LSLnU-biQNKhhsnL4
REM Extract and install Qflash
powershell -Command "Expand-Archive -Force '%~dp0\QFlash_V6.4.zip' 'C:\Quectel\'"
REM Create a traditional shortcut to QFlash 6.4 on the desktop with the proper working directory
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('C:\Users\Public\Desktop\QFlash 6.4.lnk'); $s.TargetPath = 'C:\Quectel\QFlash_V6.4\QFlash_V6.4.exe'; $s.WorkingDirectory = 'C:\Quectel\QFlash_V6.4'; $s.Save()"
REM Create a traditional shortcut to QFlash 6.4 in the Start Menu with the proper working directory
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\QFlash 6.4.lnk'); $s.TargetPath = 'C:\Quectel\QFlash_V6.6\QFlash_V6.4.exe'; $s.WorkingDirectory = 'C:\Quectel\QFlash_V6.4'; $s.Save()"
del QFlash_V6.4.zip
goto menu

:get_atpdfs
echo Come back soon! Work in progress!
pause
goto menu

:get_firmware
cls
echo These options will download a .zip with an update folder for use with Qflash
echo The.zips will save to C:\Quectel\firmware
echo Firmware Options:
echo 1) Stock Firmware
echo 2) Custom Firmware (currently only for RGMII setups)
echo 3) Go back to main Menu
echo.
set /p firmware_choice=Select firmware type: 

if "%firmware_choice%"=="1" goto stock_firmware_menu
if "%firmware_choice%"=="2" goto custom_firmware
if "%firmware_choice%"=="3" goto menu
goto menu

:stock_firmware_menu
cls
echo Stock Firmware:
echo These options will download a .zip with an update folder for use with Qflash
echo The.zips will extract to C:\Quectel\firmware\
echo Type all to download all stock firmware
echo 1) RM520NGLAAR03A02M4GA (2023-11-06)
echo 2) RM520NGLAAR03A03M4G_01.200.01.200 (2023-07-25)
echo 3) RM520NGLAAR01A08M4G_01.200.01.200 (2023-07-20)
echo 4) RM520NGLAAR01A07M4G_01.203.01.203 (2023-07-12) 
echo 5) RM520NGLAAR03A01M4G_01.202.01.202 (2023-05-12)(Super Stable)
echo 6) RM520NGLAAR01A07M4G_01.201.01.201 (2023-03-27)
echo 7) RM520NGLAAR01A06M4G_12.001.12.001 (2023-01-20)
echo 8) RM520NGLAAR01A06M4G_01.200.01.200 (2022-12-26)
echo 9) Go back to Firmware options
echo.
set /p stock_firmware_choice=Select a stock firmware: 

if "%stock_firmware_choice%"=="all" goto stock_firmware_all
if "%stock_firmware_choice%"=="1" goto stock_firmware_1
if "%stock_firmware_choice%"=="2" goto stock_firmware_2
if "%stock_firmware_choice%"=="3" goto stock_firmware_3
if "%stock_firmware_choice%"=="4" goto stock_firmware_4
if "%stock_firmware_choice%"=="5" goto stock_firmware_5
if "%stock_firmware_choice%"=="6" goto stock_firmware_6
if "%stock_firmware_choice%"=="7" goto stock_firmware_7
if "%stock_firmware_choice%"=="8" goto stock_firmware_8
if "%stock_firmware_choice%"=="9" goto get_firmware
goto menu

:stock_firmware_all
echo Downloading RM520NGLAAR03A02M4GA (2023-11-06) firmware...
megatools dl https://mega.nz/file/3UVHwbJZ#XxVYTEuPJJOxz1WrSHmkdTbNMvziU9LIDTPIbTh2rkg
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR03A02M4GA_2023_11_06\" mkdir "C:\Quectel\firmware\RM520NGLAAR03A02M4GA_2023_11_06"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR03A02M4GA_2023_11_06.zip' 'C:\Quectel\firmware\RM520NGLAAR03A02M4GA_2023_11_06'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR03A02M4GA_2023_11_06.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR03A02M4GA_2023_11_06\
echo Downloading RM520NGLAAR03A03M4G_01.200.01.200 (2023-07-25) firmware...
megatools dl https://mega.nz/file/bEdwAQwI#DVPT-QX60A7pSFVXxxukMDSXTZswTl39XlTEH_NWWpM
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR03A03M4G_2023_07_25\" mkdir "C:\Quectel\firmware\RM520NGLAAR03A03M4G_2023_07_25"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR03A03M4G_2023_07_25.zip' 'C:\Quectel\firmware\RM520NGLAAR03A03M4G_2023_07_25'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR03A03M4G_2023_07_25.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR03A03M4G_2023_07_25\
echo Downloading RM520NGLAAR01A08M4G_01.200.01.200 (2023-07-20) firmware...
megatools dl https://mega.nz/file/OZFkAC6C#xLaLs8qeOMOmic1wHLROrZedZ3USmNzGrSkFddOiAzk
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR01A08M4G_2023_07_20\" mkdir "C:\Quectel\firmware\RM520NGLAAR01A08M4G_2023_07_20"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR01A08M4G_2023_07_20.zip' 'C:\Quectel\firmware\RM520NGLAAR01A08M4G_2023_07_20'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR01A08M4G_2023_07_20.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR01A08M4G_2023_07_20\
echo Downloading RM520NGLAAR01A07M4G_01.203.01.203 (2023-07-12) firmware...
megatools dl https://mega.nz/file/LJd2yYxQ#lPdFog6G_5RFdKCltnpGKrblvEFOiW-Ctumz72LNMns
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_07_12\" mkdir "C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_07_12"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR01A07M4G_2023_07_12.zip' 'C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_07_12'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR01A07M4G_2023_07_12.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_07_12\
echo Downloading RM520NGLAAR03A01M4G_01.202.01.202 (2023-05-12) firmware...
megatools dl https://mega.nz/file/mUsXRBaI#ZIbLL2GWnTG_j8RzMaHV4fN5P6v4zBKc1MLfGX5BXH0
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR03A01M4G_2023_05_12\" mkdir "C:\Quectel\firmware\RM520NGLAAR03A01M4G_2023_05_12"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR03A01M4G_2023_05_12.zip' 'C:\Quectel\firmware\RM520NGLAAR03A01M4G_2023_05_12'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR03A01M4G_2023_05_12.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR03A01M4G_2023_05_12\
echo Downloading RM520NGLAAR01A07M4G_01.201.01.201 (2023-03-27) firmware...
megatools dl https://mega.nz/file/yRMH1YAB#-vDBJ4ywc4aM68ECG2Sef2i-5VuCHk-is05Y5HRyUJM
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_03_27\" mkdir "C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_03_27"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR01A07M4G_2023_03_27.zip' 'C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_03_27'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR01A07M4G_2023_03_27.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_03_27\
echo Downloading RM520NGLAAR01A06M4G_12.001.12.001 (2023-01-20) firmware...
megatools dl https://mega.nz/file/2NVlUSiK#V7Gt1KHpbQIw8J66wo07PMqamGjQK1uXfu1etbjENvs
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR01A06M4G_2023_01_20\" mkdir "C:\Quectel\firmware\RM520NGLAAR01A06M4G_2023_01_20"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR01A06M4G_2023_01_20.zip' 'C:\Quectel\firmware\RM520NGLAAR01A06M4G_2023_01_20'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR01A06M4G_2023_01_20.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR01A06M4G_2023_01_20\
echo Downloading RM520NGLAAR01A06M4G_01.200.01.200 (2022-12-26) firmware...
megatools dl https://mega.nz/file/SBVDCDbB#oGc7xp0BwjweSqACmxWHjlAZwVuBNtNa-v1z6ob43oQ
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR01A06M4G_2022_12_26\" mkdir "C:\Quectel\firmware\RM520NGLAAR01A06M4G_2022_12_26"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR01A06M4G_2022_12_26.zip' 'C:\Quectel\firmware\RM520NGLAAR01A06M4G_2022_12_26'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR01A06M4G_2022_12_26.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR01A06M4G_2022_12_26\
goto get_firmware

:stock_firmware_1
echo Downloading RM520NGLAAR03A02M4GA (2023-11-06) firmware...
megatools dl https://mega.nz/file/3UVHwbJZ#XxVYTEuPJJOxz1WrSHmkdTbNMvziU9LIDTPIbTh2rkg
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR03A02M4GA_2023_11_06\" mkdir "C:\Quectel\firmware\RM520NGLAAR03A02M4GA_2023_11_06"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR03A02M4GA_2023_11_06.zip' 'C:\Quectel\firmware\RM520NGLAAR03A02M4GA_2023_11_06'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR03A02M4GA_2023_11_06.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR03A02M4GA_2023_11_06\
timeout /t 4
goto stock_firmware_menu

:stock_firmware_2
echo Downloading RM520NGLAAR03A03M4G_01.200.01.200 (2023-07-25) firmware...
megatools dl https://mega.nz/file/bEdwAQwI#DVPT-QX60A7pSFVXxxukMDSXTZswTl39XlTEH_NWWpM
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR03A03M4G_2023_07_25\" mkdir "C:\Quectel\firmware\RM520NGLAAR03A03M4G_2023_07_25"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR03A03M4G_2023_07_25.zip' 'C:\Quectel\firmware\RM520NGLAAR03A03M4G_2023_07_25'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR03A03M4G_2023_07_25.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR03A03M4G_2023_07_25\
timeout /t 4
goto stock_firmware_menu

:stock_firmware_3
echo Downloading RM520NGLAAR01A08M4G_01.200.01.200 (2023-07-20) firmware...
megatools dl https://mega.nz/file/OZFkAC6C#xLaLs8qeOMOmic1wHLROrZedZ3USmNzGrSkFddOiAzk
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR01A08M4G_2023_07_20\" mkdir "C:\Quectel\firmware\RM520NGLAAR01A08M4G_2023_07_20"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR01A08M4G_2023_07_20.zip' 'C:\Quectel\firmware\RM520NGLAAR01A08M4G_2023_07_20'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR01A08M4G_2023_07_20.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR01A08M4G_2023_07_20\
timeout /t 4
goto stock_firmware_menu

:stock_firmware_4
echo Downloading RM520NGLAAR01A07M4G_01.203.01.203 (2023-07-12) firmware...
megatools dl https://mega.nz/file/LJd2yYxQ#lPdFog6G_5RFdKCltnpGKrblvEFOiW-Ctumz72LNMns
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_07_12\" mkdir "C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_07_12"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR01A07M4G_2023_07_12.zip' 'C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_07_12'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR01A07M4G_2023_07_12.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_07_12\
timeout /t 4
goto stock_firmware_menu

:stock_firmware_5
echo Downloading RM520NGLAAR03A01M4G_01.202.01.202 (2023-05-12) firmware...
megatools dl https://mega.nz/file/mUsXRBaI#ZIbLL2GWnTG_j8RzMaHV4fN5P6v4zBKc1MLfGX5BXH0
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR03A01M4G_2023_05_12\" mkdir "C:\Quectel\firmware\RM520NGLAAR03A01M4G_2023_05_12"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR03A01M4G_2023_05_12.zip' 'C:\Quectel\firmware\RM520NGLAAR03A01M4G_2023_05_12'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR03A01M4G_2023_05_12.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR03A01M4G_2023_05_12\
timeout /t 4
goto stock_firmware_menu

:stock_firmware_6
echo Downloading RM520NGLAAR01A07M4G_01.201.01.201 (2023-03-27) firmware...
megatools dl https://mega.nz/file/yRMH1YAB#-vDBJ4ywc4aM68ECG2Sef2i-5VuCHk-is05Y5HRyUJM
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_03_27\" mkdir "C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_03_27"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR01A07M4G_2023_03_27.zip' 'C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_03_27'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR01A07M4G_2023_03_27.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR01A07M4G_2023_03_27\
timeout /t 4
goto stock_firmware_menu

:stock_firmware_7
echo Downloading RM520NGLAAR01A06M4G_12.001.12.001 (2023-01-20) firmware...
megatools dl https://mega.nz/file/2NVlUSiK#V7Gt1KHpbQIw8J66wo07PMqamGjQK1uXfu1etbjENvs
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR01A06M4G_2023_01_20\" mkdir "C:\Quectel\firmware\RM520NGLAAR01A06M4G_2023_01_20"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR01A06M4G_2023_01_20.zip' 'C:\Quectel\firmware\RM520NGLAAR01A06M4G_2023_01_20'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR01A06M4G_2023_01_20.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR01A06M4G_2023_01_20\
timeout /t 4
goto stock_firmware_menu

:stock_firmware_8
echo Downloading RM520NGLAAR01A06M4G_01.200.01.200 (2022-12-26) firmware...
megatools dl https://mega.nz/file/SBVDCDbB#oGc7xp0BwjweSqACmxWHjlAZwVuBNtNa-v1z6ob43oQ
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\RM520NGLAAR01A06M4G_2022_12_26\" mkdir "C:\Quectel\firmware\RM520NGLAAR01A06M4G_2022_12_26"
powershell -Command "Expand-Archive -Force 'RM520NGLAAR01A06M4G_2022_12_26.zip' 'C:\Quectel\firmware\RM520NGLAAR01A06M4G_2022_12_26'"
echo Deleting downloaded ZIP file...
del "RM520NGLAAR01A06M4G_2022_12_26.zip"
echo Firmware extracted to C:\Quectel\firmware\RM520NGLAAR01A06M4G_2022_12_26\
timeout /t 4
goto stock_firmware_menu

:custom_firmware
cls
echo Custom Firmware
echo These options will download a .zip with an update folder for use with Qflash
echo The.zips will extract to C:\Quectel\firmware\
echo Firmware Options:
echo 1) Arixolink RM520NGLAAR03A01M4G OCPU_BETA_20230419C (2023-11-07)
echo 2) Go back to last Menu
echo.
set /p firmware_choice=Select firmware type: 

if "%firmware_choice%"=="1" goto custom_firmware_1
if "%firmware_choice%"=="2" goto get_firmware
goto menu

:custom_firmware_1
echo Downloading RM520NGLAAR01A06M4G_01.200.01.200 (2022-12-26) firmware...
megatools dl https://mega.nz/file/vZsyhaoA#LOav6ZB9ZK15Vm8Nph1s6LpbmHTZNn0f8MsjvFcby1c
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\Arixolink_RM520NGLAAR03A01M4G_2023_11_07\" mkdir "C:\Quectel\firmware\Arixolink_RM520NGLAAR03A01M4G_2023_11_07"
powershell -Command "Expand-Archive -Force 'Arixolink_RM520NGLAAR03A01M4G_2023_11_07.zip' 'C:\Quectel\firmware\Arixolink_RM520NGLAAR03A01M4G_2023_11_07'"
echo Deleting downloaded ZIP file...
del "Arixolink_RM520NGLAAR03A01M4G_2023_11_07.zip"
echo Firmware extracted to C:\Quectel\firmware\Arixolink_RM520NGLAAR03A01M4G_2023_11_07\
timeout /t 4
goto stock_firmware_menu

:install_qnavigator
cls
echo Qnavigator Versions:
echo 1) Qnavigator 1.6.10
echo 2) Qnavigator 1.6.9.1
echo 3) Go Back
echo.
set /p qnavigator_choice=Select a Qnavigator version: 

if "%qnavigator_choice%"=="1" goto qnavigator_v1
if "%qnavigator_choice%"=="2" goto qnavigator_v2
if "%qnavigator_choice%"=="3" goto menu
goto menu

:qnavigator_v1
echo Downloading Qnavigator 1.6.10...
megatools dl https://mega.nz/file/GdEWHSLa#vYQnNUMArmWwxfzfn6gvbFWI52jtNbnD9Atr0COEIqo
powershell -Command "Expand-Archive -Force 'Qnavigator_V1.6.10.zip' 'C:\Quectel\'"
REM Create a traditional shortcut to QNavigator 1.6.10 on the desktop with the proper working directory
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('C:\Users\Public\Desktop\QNavigator V1.6.10.lnk'); $s.TargetPath = 'C:\Quectel\Qnavigator_V1.6.10\Qnavigator.exe'; $s.WorkingDirectory = 'C:\Quectel\Qnavigator_V1.6.10'; $s.Save()"
REM Create a traditional shortcut to QNavigator 1.6.10 in the Start Menu with the proper working directory
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\QNavigator V1.6.10.lnk'); $s.TargetPath = 'C:\Quectel\Qnavigator_V1.6.10\Qnavigator.exe'; $s.WorkingDirectory = 'C:\Quectel\Qnavigator_V1.6.10'; $s.Save()"
echo Deleting downloaded ZIP file...
del "Qnavigator_V1.6.10.zip"
echo Installed! Shortcuts have been placed on the desktop and start menu
timeout /t 4
goto menu

:qnavigator_v2
echo Downloading Qnavigator 1.6.9.1...
megatools dl https://mega.nz/file/DQFSmDob#0o-PKKEUcdLYpi4UNBQ90IowzQyPduqdKaVVjFcYAi0
powershell -Command "Expand-Archive -Force 'Qnavigator_V1.6.9.1.zip' 'C:\Quectel\'"
REM Create a traditional shortcut to QNavigator 1.6.9.1 on the desktop with the proper working directory
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('C:\Users\Public\Desktop\QNavigator 1.6.9.1.lnk'); $s.TargetPath = 'C:\Quectel\Qnavigator_V1.6.9.1\Qnavigator_V1.6.9.1.exe'; $s.WorkingDirectory = 'C:\Quectel\Qnavigator_V1.6.9.1'; $s.Save()"
REM Create a traditional shortcut to QNavigator 1.6.10 in the Start Menu with the proper working directory
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Qnavigator_V1.6.9.1.lnk'); $s.TargetPath = 'C:\Quectel\Qnavigator_V1.6.9.1\Qnavigator_V1.6.9.1.exe'; $s.WorkingDirectory = 'C:\Quectel\Qnavigator_V1.6.9.1'; $s.Save()"
echo Deleting downloaded ZIP file...
del "Qnavigator_V1.6.9.1.zip"
echo Installed! Shortcuts have been placed on the desktop and start menu
timeout /t 4
goto menu


:adb_setup
cls
echo ADB needs to be or have already been unlocked on the modem.
echo 1) Unlock with custom firmware for RGMII setups (For use with RJ45 to M.2 boards only)
echo 2) Unlock the normal way
echo 3) I've already unlocked it! (skip to ADB+ installer)
echo 4) Back to main menu
echo.
set /p adb_choice=Select an option: 

if "%adb_choice%"=="1" goto unlock_rgmi
if "%adb_choice%"=="2" goto unlock_standard
if "%adb_choice%"=="3" goto adb_installer
if "%adb_choice%"=="4" goto menu
goto menu

:unlock_rgmi
echo To unlock ADB by using the custom firmware for RGMII setups you need to flash the custom firmware
echo Would you like to copy the custom formware to your C:\Quectel\firmware folder for use with Qflash?
echo 1) Yes
echo 2) No
echo.
set /p rgmii_choice=Select an option:

if "%rgmii_choice%"=="1" goto unlock_rgmi_yes
if "%rgmii_choice%"=="2" goto adb_setup
goto adb_setup

:unlock_rgmii_yes
echo Downloading RM520NGLAAR01A06M4G_01.200.01.200 (2022-12-26) firmware...
megatools dl https://mega.nz/file/vZsyhaoA#LOav6ZB9ZK15Vm8Nph1s6LpbmHTZNn0f8MsjvFcby1c
echo Extracting firmware...
REM Create the target directory if it does not exist
if not exist "C:\Quectel\firmware\Arixolink_RM520NGLAAR03A01M4G_2023_11_07\" mkdir "C:\Quectel\firmware\Arixolink_RM520NGLAAR03A01M4G_2023_11_07"
powershell -Command "Expand-Archive -Force 'Arixolink_RM520NGLAAR03A01M4G_2023_11_07.zip' 'C:\Quectel\firmware\Arixolink_RM520NGLAAR03A01M4G_2023_11_07'"
echo Deleting downloaded ZIP file...
del "Arixolink_RM520NGLAAR03A01M4G_2023_11_07.zip"
echo Firmware extracted to C:\Quectel\firmware\Arixolink_RM520NGLAAR03A01M4G_2023_11_07\
echo Flash that firmware with Qflash, then connect to the modem by ethernet
echo Go to 192.168.225.1 default password is 123456
echo Find the ADB Switch and turn it on then reboot. Thats it. ADB will be unlocked.
timeout /t 6
goto adb_setup

:unlock_standard
echo Opening instructions for standard ADB unlocking...
start https://github.com/iamromulan/quectel-rgmii-configuration-notes#unlocking-and-using-adb
echo Please follow the instructions in the opened web page to unlock ADB the standard way.
timeout /t 6
goto adb_setup


:adb_installer
echo Downloading ADB and Fastboot++ installer...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/K3V1991/ADB-and-FastbootPlusPlus/releases/download/v1.0.8/ADB-and-Fastboot++_v1.0.8.exe' -OutFile 'C:\Quectel\ADB-and-Fastboot++_v1.0.8.exe'"
echo Make sure Add to system path Env is checked
echo Make sure Install universal adb Driver is checked
echo Running the installer in 4 seconds...
timeout /t 4
start "" "C:\Quectel\ADB-and-Fastboot++_v1.0.8.exe"
echo Follow the installer instructions to complete the setup.
timeout /t 6
goto menu

:end_script
echo Exiting the installer...
echo Cleaning up...
del "%~dp0\megatools.zip"
rmdir /s /q "%~dp0\megatools"
exit /b
