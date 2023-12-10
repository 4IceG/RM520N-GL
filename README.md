# RM520N-GL
The Quectel RM520N-GL is 5G IoT module specially optimized for IoT/eMBB applications. 

You will find Tools, Docs, and Firmware for it here, as well as a .cmd that installs everything for windows.
# Table of Contents
- [Windows Autoinstaller](#windows-autoinstaller)
- [How to install firmware with Qflash (Windows)](#how-to-install-firmware-with-qflash-on-windows)
- [How to use Qnavigator to send AT commands](#how-to-use-qnavigator-to-send-at-commands)
- [Toolz](#toolz)
- [Stock Firmware](#stock-firmware)
- [Custom Firmware](#custom-firmware)
- [AT commands](#at-commands)
- [Other Docs](#other-docs)
- [Description of antenna connection](#description-of-antenna-connection)
- [Specification](#specification)

## Windows Autoinstaller:
![cmd repo](https://github.com/iamromulan/quectel-rgmii-configuration-notes/blob/main/images/repocmd.png?raw=true)

**[RM520 Resource Package DOWNLOAD](https://mega.nz/file/LdExyA7L#_XOa8fjVgHfH8k6cwnBelqA5ntIzzbEPnQdQhvAP6Jg)**

**Note**

Unfortunately due to GitHub's 100MB per file limit, Qflash and the firmware directory couldn't be uploaded to the repository. It is however included in the latest [RM520 Resource Package](https://mega.nz/file/LdExyA7L#_XOa8fjVgHfH8k6cwnBelqA5ntIzzbEPnQdQhvAP6Jg) and by using their download links listed here.

**What this does**

It is a menu style cmd script that will let you install Qflash, Qnav, Qcom, and ADB tools. It will also let you download firmware and PDFs. It heavily relies on megatools, a cli for downloading files from mega.nz
It will temporarily download megatools to the directory its ran at first use and delete them when exiting using the menu option.
All files installed/downloaded will go to C:\Quectel\
## How to install firmware with Qflash on Windows 
Connect your modem to your computer by USB. Either through a USB to m.2 B-key sled (should have a sim slot as well) or by using an RGMII board's USB C port.
### If you installed by using the autoinstaller: 
C:\Quectel\firmware to store your firmware zips was created and C:\Quectel\flash was created to flash the firmware from.
Firmware is packed up in a .zip file like this: `RM520NGLAAR01A07M4G_01.203.01.203`
#### 1. Open your firmware .zip and copy the `update` folder to C:\Quectel\flash 
* Or just somewhere with no spaces in the folder name on any folder on the way to it (For example: C:\Quectel\flash will work  C:\Qu ectel\fla sh will not work)
#### 2. Open device manager, go to ports, take note of what the port number is for the DM port. 
![COM ports](https://github.com/iamromulan/quectel-rgmii-configuration-notes/blob/main/images/ports.png?raw=true)
* In this case the DM port is port 11
 #### 3. Open Qflash, under COM port set it to the DM port. In my case it was 11 so I will use 11. Set the baudrate to 460800. 
 ![COMandBAUD](https://github.com/iamromulan/quectel-rgmii-configuration-notes/blob/main/images/portbauadqflash.png?raw=true)
 #### 4. Click Load FW files, then go to the update folder you copied from your firmware zip, go to firehose, then select/open the "prog firehose" file. 
 ![selectPROGfirehose](https://github.com/iamromulan/quectel-rgmii-configuration-notes/blob/main/images/selectprogfirehose.png?raw=true)
 #### 5. Click Start! The firmware will flash and the modem will reboot. After it reboots and comes back up Qflash should say "PASS" indicating it was successful. When done delete the update folder from your flash folder.

## How to use Qnavigator to send AT commands

Connect your modem to your computer by USB. Either through a USB to m.2 B-key sled (should have a sim slot as well) from Amazon or by using an RGMII board's USB C port.
### If you installed by using the autoinstaller: 
You should already have a desktop icon and start menu shortcut for Qnavigator.
#### 1. Open Qnavagator, you'll be presented with this screen, just press escape (ESC) to skip their directions. 
![COM ports](https://github.com/iamromulan/quectel-rgmii-configuration-notes/blob/main/images/qnavfirst.png?raw=true)
#### 2. Uncheck Automatic initialization (circled in red) and click the COM plug icon (circled in green)
![COM ports](https://github.com/iamromulan/quectel-rgmii-configuration-notes/blob/main/images/qnavsec.png?raw=true)
#### 3. Click ok, the correct port will already be auto selected
![qnavCOMport](https://github.com/iamromulan/quectel-rgmii-configuration-notes/blob/main/images/qnavport.png?raw=true)
#### 4. Click Connect to module, then in the lower right type your AT command and press send. The response will be shown above.
![at](https://github.com/iamromulan/quectel-rgmii-configuration-notes/blob/main/images/qnavat.png?raw=true)
## Toolz:
### Windows:

<a href="https://mega.nz/file/GVMS1D7K#ogA1oLOwhkRlLWDDhisG9p0k1H_jhcAJOesHHV-XKUg">Quectel Windows USB Driver(Q) NDIS V2.6.0</a>

<a href="https://mega.nz/file/jFlnkIoC#2HSmvJTVQvcCjN8xYj6G2UxY91khYbLdvTF9NoXRGfQ">Quectel Windows USB Driver(Q) NDIS V2.4.6</a> 

<a href="https://mega.nz/file/XctiBLRQ#TPjrW5AKIcct9giF7aZlaxTwUM9Huwpa0mOls4xP5NE" title="Quectel_Windows_USB_DriverQ_NDIS_V2.4.6">Quectel Windows USB Driver(Q) MBIM V1.3.1</a>

<a href="https://mega.nz/file/Sclj0C5Q#EJ3xr60g99thcuyVav42bOjs-z_Iu-Qv3hYycrJAjbk" title="RNDIS_V1.0.9.zip">Quectel Windows USB Driver(Q) RNDIS V1.0.9</a>

[QFlash V6.6 EN](https://mega.nz/file/Lc8E3BLB#RoYzTEdk1TS3EKC_REEPQ18MrNo5c5BFQ7iT18Bx-A4) 

[QFlash V6.4 EN](https://mega.nz/file/PEFT1A5Z#uGUNnpcKtKwmd_lw8POnY51Jr2LSLnU-biQNKhhsnL4) 

<a href="https://drive.google.com/file/d/1j3Wy_znL2ajt2_Rc4gejgoJRcp8ieQLm/view?usp=sharing" title="QFlash.V5.8.EN">QFlash V5.8 EN</a> (Not included in .cmd)

<a href="https://mega.nz/file/GdEWHSLa#vYQnNUMArmWwxfzfn6gvbFWI52jtNbnD9Atr0COEIqo" title="Qnavigator_V1.6.10">Qnavigator V1.6.10</a>

<a href="https://mega.nz/file/DQFSmDob#0o-PKKEUcdLYpi4UNBQ90IowzQyPduqdKaVVjFcYAi0" title="Qnavigator_V1.6.9.1.zip">Qnavigator V1.6.9.1</a>

<a href="https://mega.nz/file/qVd00YTT#SDe_oaYEZdxE1ZYcV32gG_7HgkHfO9sJfBX440e59xU" title="QCOM_V1.6">QCOM V1.6</a>

### Linux

[QFirehose V1.4.17](https://mega.nz/file/HNdEHI5I#tbOhCRS5vNZ-J9eEVVD_ip-YrU2cIYeD9bLO0j24gz4) 

<a href="https://mega.nz/file/jN1wnZzL#nHb7rB1A5QiY3hW1QZWkXljGQcl_73WWCTwC8mRl0kg" title="QFirehose_Linux_Android_V1.4.15">QFirehose V1.4.15</a>

<a href="https://mega.nz/file/aFlVgBZT#RC3tJWaiya-uvlFLiZoq_Y6n3rc8vEKcNhtzagI_2FA" title="QFirehose_Linux_Android_V1.4.11">QFirehose V1.4.11</a>

[DFOTA Generation Tool](https://mega.nz/file/TIV0wAyQ#tyHLdmeHLPd2_ZmxjiLZPtDLY9OlhhjN1tiXR9hpdtM) 

## Stock Firmware
All are included in the repo .CMD

<a href="https://mega.nz/file/3UVHwbJZ#XxVYTEuPJJOxz1WrSHmkdTbNMvziU9LIDTPIbTh2rkg">RM520NGLAAR03A02M4GA
 (2023-11-06)</a> 

<a href="https://mega.nz/file/bEdwAQwI#DVPT-QX60A7pSFVXxxukMDSXTZswTl39XlTEH_NWWpM">RM520NGLAAR03A03M4G_01.200.01.200
 (2023-07-25)</a> 

<a href="https://mega.nz/file/OZFkAC6C#xLaLs8qeOMOmic1wHLROrZedZ3USmNzGrSkFddOiAzk">RM520NGLAAR01A08M4G_01.200.01.200
 (2023-07-20)</a> 

<a href="https://mega.nz/file/LJd2yYxQ#lPdFog6G_5RFdKCltnpGKrblvEFOiW-Ctumz72LNMns" title="RM520NGLAAR01A07M4G_01.203.01.203">RM520NGLAAR01A07M4G_01.203.01.203 
(2023-07-12)</a> 

<a href="https://mega.nz/file/mUsXRBaI#ZIbLL2GWnTG_j8RzMaHV4fN5P6v4zBKc1MLfGX5BXH0" title="RM520NGLAAR03A01M4G_01.202.01.202">RM520NGLAAR03A01M4G_01.202.01.202 
(2023-05-12)</a>

<a href="https://mega.nz/file/yRMH1YAB#-vDBJ4ywc4aM68ECG2Sef2i-5VuCHk-is05Y5HRyUJM" title="RM520NGLAAR01A07M4G_01.201.01.201">RM520NGLAAR01A07M4G_01.201.01.201 
(2023-03-27)</a>

<a href="https://mega.nz/file/2NVlUSiK#V7Gt1KHpbQIw8J66wo07PMqamGjQK1uXfu1etbjENvs" title="RM520NGLAAR01A06M4G_12.001.12.001">RM520NGLAAR01A06M4G_12.001.12.001 
(2023-01-20)</a>

<a href="https://mega.nz/file/SBVDCDbB#oGc7xp0BwjweSqACmxWHjlAZwVuBNtNa-v1z6ob43oQ" title="RM520NGLAAR01A06M4G_01.200.01.200 2">RM520NGLAAR01A06M4G_01.200.01.200 
(2022-12-26)</a>

## Custom Firmware
#### Firmware for use in RGMII setups:
[Arixolink RM520NGLAAR03A01M4G OCPU_BETA_20230419C 
(R01.00.04_2023-11-07)](https://mega.nz/file/vZsyhaoA#LOav6ZB9ZK15Vm8Nph1s6LpbmHTZNn0f8MsjvFcby1c)

- Full .tgz project: [Download](https://mega.nz/file/CdVimDjL#EzL7rK5hy2VGXdj31R3jAWFDkncnvwxviaqVRzPcTY0)
## AT commands
<a href="https://mega.nz/file/zEEmCYTb#Y_YVlSEWNn9tz9dpHvY1rSZuDR_gEB6XEVIQ0nGrCJQ" title="Quectel RM520N AT Commands Manual V1.0.0">Quectel RM520N AT Commands Manual V1.0 
(2023-07-31)</a>

<a href="https://mega.nz/file/zIllzT7S#leMbHiKL_jmEy2LZMp1-3aI2BLW2m8vkNFl8ApT3FQw" title="Quectel RM520N AT Commands Manual V1.0.0">Quectel RM520N AT Commands Manual V1.0 
(2022-08-12)</a>

<a href="https://mega.nz/file/mVNRXZrI#FS1_8YIZgqEEcyjWG1__RMI5IeiTc6yrwU9xw6bCpsQ" title="Quectel RM520N AT Commands Manual V1.2">Quectel RM520N AT Commands Manual V1.2
(2021-08-09)</a>

<a href="https://mega.nz/file/nIlhFBhS#QuJZIaN0EkBvLYqFhSUCv_qjx0aGsSG04VXUp1huATw">Quectel RM520N AT Commands Manual V1.1 
(2020-10-09)</a>

## Other Docs
<a href="https://mega.nz/file/LRVDDYCQ#VFARx9j_0g43LaBS_-4IPDjQwAR55dePl4eVgFQcGXY">DFOTA Generation Tool Directions</a>

<a href="https://mega.nz/file/TI9yHTjL#iJVMKIMRH-gaIwoSZkUDgmAU3s9hjL3I1brFHeV0t-I">Quectel Product Brochure V7.4</a>

<a href="https://mega.nz/file/HMsgAI7Q#kVLf7ETrE13zrsUUmdq2NUe2d26ZSkbeqgmNXQ4offw">QCOM User Guide V1.1</a>

<a href="https://mega.nz/file/bQsw1YqS#c2j1rqAvUZRAhQUniaHfUD0CZZNvxtusW12eIgReDzI">QFlash User Guide V5.0 </a>

<a href="https://mega.nz/file/fJEG1bDJ#KKkdZOrS0o4xu_3WXLdy3l6N1Aj6-sZYTxceF99oB2I">Quectel RM520N-GL Hardware Design</a>


## Description of antenna connection
![](https://github.com/4IceG/Personal_data/blob/master/5G/antenasmall.png?raw=true)
![](https://github.com/4IceG/Personal_data/blob/master/5G/rm520n-gl.PNG?raw=true)

## Specification
![](https://github.com/4IceG/Personal_data/blob/master/5G/quectel_rm520n-gl_5g_specification_v1-0-0_preliminary_20210915-1.png?raw=true)
![](https://github.com/4IceG/Personal_data/blob/master/5G/quectel_rm520n-gl_5g_specification_v1-0-0_preliminary_20210915-2.png?raw=true)


