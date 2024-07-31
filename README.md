# RM520N-GL
The Quectel RM520N-GL is 5G IoT module specially optimized for IoT/eMBB applications.

You will find Tools, Docs, and Firmware for it here, as well as a .exe (QuecDeploy) that installs everything for windows.
## QuecDeploy:
![Screenshot 2024-07-31 130755](https://github.com/user-attachments/assets/dc351b48-3682-4181-b33c-843136221d1c)

**[QuecDeploy DOWNLOAD](https://github.com/iamromulan/rm520n-gl/releases)**

**Note**

Unfortunately due to GitHub's 100MB per file limit, Qflash and the firmware directory couldn't be uploaded to the repository. It is however included in the latest [QuecDeploy](https://github.com/iamromulan/rm520n-gl/releases) and by using their download links listed here.

**What this does**

It is a menu style Powershell script that will let you install Qflash and Qnav. adb abd fastboot are now automaticly included with Qflash! It will also let you download firmware and view PDF for several modems. It heavily relies on megatools, a cli for downloading files from mega.nz
All files installed/downloaded will go to C:\Quectel\

# Table of Contents
- [QuecDeploy](#quecdeploy)
- [Toolz](#toolz)
- [Firmware](#firmware)
- [Firmware update instructions](#firmware-update-instructions)
- [How to use Qnavigator to send AT commands](#how-to-use-qnavigator-to-send-at-commands)
- [AT commands](#at-commands)
- [Other Docs](#other-docs)
- [Description of antenna connection](#description-of-antenna-connection)
- [Specification](#specification)

## Toolz:
<details>
   <summary>Windows | View</summary>

[Quectel Windows USB Driver(Q) NDIS V2.7](https://mega.nz/file/zJd1CYbL#OuzK4SaghBZuQ_RLstw--I38179sZM7TkkktL2IIsm4) (Recommended)

[Quectel Windows USB Driver(Q) ECM V1.0](https://mega.nz/file/7IEjESSB#5jj1v7F3WWVfy6cFzdvfCHxaoTENMgBW2v_94NtgpoA)

[Quectel Windows USB Driver(Q) MBIM V1.3](https://mega.nz/file/XRc0nZSQ#9hPjcrasgOQ9ej_tWQhvC6_NQC3iZMIdu0t17sz7AHE)

[Quectel Windows USB Driver(Q) RNDIS V1.1](https://mega.nz/file/vRN1ERaL#0zp9di4iFEaamkczsmw_Xaxr3fcWS7in9ODXZ73l8Lg)

[QFlash V7.1 EN](https://mega.nz/file/bdUWiKSQ#7RPymUcm7Rgdjf9mRsWjuf9zXia5qxV7NZWMLruvb5A) 

[QFlash V6.9 EN](https://mega.nz/file/vdFH0LrB#lnrp3G4HEmgcwGTViQzpFm2iNxBYe5k_EkdGRvglJdA)

[QFlash_PCIE_V1.0](https://mega.nz/file/SB9C3JqR#1qrUfTIzL0n-Wwpsnz8MIDjH4rifp5V8Tshax5Te7Ho)

[Qnavigator V1.6.10](https://mega.nz/file/2RMFAbCT#zq3r9TmEF8REXK6PkuAXFiuyPI5Tw4oqYnHGEiSmoD4)

[QCOM V1.8.2](https://mega.nz/file/CVcFgQLI#b1AfPvmIq9N_MHQBi8MkZFphADdW3Af7Hc8kFH0LiW8)

<a href="https://drive.google.com/file/d/1xVw5IBowlKn7HPqfyYfoZdBx1p5Xs7aU/view?usp=sharing" title="QCOM_V1.6">QCOM V1.6</a>

</details>

<details>
   <summary>Linux | View</summary>

<a href="https://github.com/4IceG/RM520N-GL/blob/main/Toolz/QFirehose_Linux_Android_V1.4.17.zip" title="QFirehose_Linux_Android_V1.4.17">QFirehose V1.4.17</a>

<a href="https://github.com/4IceG/RM520N-GL/blob/main/Toolz/QFirehose_Linux_Android_V1.4.15.zip" title="QFirehose_Linux_Android_V1.4.15">QFirehose V1.4.15</a>

<a href="https://github.com/4IceG/RM520N-GL/blob/main/Toolz/QFirehose_Linux_Android_V1.4.11.zip" title="QFirehose_Linux_Android_V1.4.11">QFirehose V1.4.11</a>

<a href="https://drive.google.com/file/d/1Jn4gzJRCzX_pzmGOqurwqAQMLiQsShV4/view?usp=drive_link" title="DFOTA Generation Tool">DFOTA Generation Tool</a>

<a href="https://drive.google.com/file/d/1V9zK4IWE0zuZxEpAr2JOm4AID0yZrm6h/view?usp=drive_link" title="Quectel_Linux_PCIE_MHI_Driver_V1.3.3">Quectel Linux PCIE MHI Driver V1.3.3</a>

<a href="https://drive.google.com/file/d/1amE1TgwuLh0bgos1T6rQMphIOnv_f1_T/view?usp=drive_link" title="Quectel_Linux_Android_SPRD_PCIE_Driver_V1.1.1">Quectel Linux Android SPRD PCIE Driver V1.1.1</a>

<a href="https://drive.google.com/file/d/1Sh4BHusGdrteIZCUN63SngR32zRfiGDC/view?usp=drive_link" title="Quectel_Linux_Android_QMI_WWAN_Driver_V1.2.1">Quectel Linux Android QMI WWAN_Driver V1.2.1</a>

<a href="https://drive.google.com/file/d/1iTC4nbNNMtpxrKFLDYvseReA8vR9Quwh/view?usp=drive_link" title="Quectel_Linux_Android_GobiNet_Driver_V1.6.3">Quectel Linux Android GobiNet Driver V1.6.3</a>

</details>

## Firmware:
<details>
   <summary>Stock | View</summary>

| Date | Version | Link |
| --- | --- | --- |
| `2024-04-03` | *RM520NGLAAR01A08M4G* | <a href="https://mega.nz/file/ucclVCLT#chq0HzixUTPoNpG9G2duv5Xhj2JChz2ALa6QJpZJ3kY">Download</a> |
| `2024-02-01` | *RM520NGLAAR01A08M4G* | <a href="https://mega.nz/file/2NdzWKJJ#n4EbQkh17Pwfkfxzz-ZbjN5MFK6fJVRgLx6Chh43QRk">Download</a> |
| `2023-07-20` | *RM520NGLAAR01A08M4G* | <a href="https://mega.nz/file/SYMh0YwI#xLaLs8qeOMOmic1wHLROrZedZ3USmNzGrSkFddOiAzk">Download</a> |
| `2023-07-12` | *RM520NGLAAR01A07M4G* | <a href="https://mega.nz/file/LJd2yYxQ#lPdFog6G_5RFdKCltnpGKrblvEFOiW-Ctumz72LNMns">Download</a> |
| `2023-03-27` | *RM520NGLAAR01A07M4G* | <a href="https://mega.nz/file/bFdVlJAB#-vDBJ4ywc4aM68ECG2Sef2i-5VuCHk-is05Y5HRyUJM">Download</a> |
| `2023-01-20` | *RM520NGLAAR01A06M4G* | <a href="https://mega.nz/file/TJ8m1QoB#V7Gt1KHpbQIw8J66wo07PMqamGjQK1uXfu1etbjENvs">Download</a> |
| `2022-12-26` | *RM520NGLAAR01A06M4G* | <a href="https://mega.nz/file/7dVlmaRL#oGc7xp0BwjweSqACmxWHjlAZwVuBNtNa-v1z6ob43oQ">Download</a> |

</details>

<details>
   <summary>Certified | View</summary>

| Date | Version | Link |
| --- | --- | --- |
| `2024-03-28` | *RM520NGLAAR03A03M4G* | <a href="https://mega.nz/file/PcV0DDzA#aeQkP3V6WnzvO5BUPTw0Vm1Zdb5n9AA0Zb3ebSsHYlM">Download</a> |
| `2024-01-02` | *RM520NGLAAR03A01M4G* | <a href="https://mega.nz/file/fdE1iY4T#4q_gz03GbQZ6mR3-SdQVptelwNPrklVSPWa1VcH9pVo">Download</a> |
| `2023-11-26` | *RM520NGLAAR03A02M4GA* | <a href="https://mega.nz/file/uZsCkCyL#XxVYTEuPJJOxz1WrSHmkdTbNMvziU9LIDTPIbTh2rkg">Download</a> |
| `2023-07-25` | *RM520NGLAAR03A03M4G* | <a href="https://mega.nz/file/TJFSiBqJ#DVPT-QX60A7pSFVXxxukMDSXTZswTl39XlTEH_NWWpM">Download</a> |
| `2023-05-12` | *RM520NGLAAR03A01M4G* | <a href="https://mega.nz/file/yd8ATTCb#ZIbLL2GWnTG_j8RzMaHV4fN5P6v4zBKc1MLfGX5BXH0">Download</a> |

</details>

<details>
   <summary>Custom | View</summary>
   
| Date | Version | Link | Full Project |
| --- | --- | --- | --- |
| `R01.00.04_2023-11-07` | *Arixolink RM520NGLAAR03A01M4G OCPU_BETA_20230419C* | [Download](https://mega.nz/file/fZcUjCLK#LOav6ZB9ZK15Vm8Nph1s6LpbmHTZNn0f8MsjvFcby1c) | [Download](https://mega.nz/file/mRMVjSxB#EzL7rK5hy2VGXdj31R3jAWFDkncnvwxviaqVRzPcTY0)
   
</details>

## Firmware update instructions:

<details>
   <summary>Windows | View</summary>

Step 1.
> Install modem drivers [Quectel Windows USB Driver(Q) NDIS V2.6.0](https://mega.nz/file/GVMS1D7K#ogA1oLOwhkRlLWDDhisG9p0k1H_jhcAJOesHHV-XKUg)  on your system. The [Windows Autoinstaller](#windows-autoinstaller) will help you do this as well. If you don't already have QFlash install it from the [Windows Autoinstaller](#windows-autoinstaller) or the respective link in [Toolz](#toolz)

Step 2.
> Connect modem to your computer, by usb

Step 3.
> Go to device manager and check if the new COM ports are visible in the system. Restart your computer if the new COM ports are not visible.

![](https://github.com/iamromulan/quectel-rgmii-configuration-notes/blob/main/images/ports.png?raw=tru)

> Remember the number of the COM port described as "DM Port".

Step 4.
> Run QFlash 
> Remember to avoid spaces in the path where QFlash is installed to and firmware location
> Example: C:\Quectel\Q flash is bad while C:\Quectel\Qflash is good

> Select the COM port number as the DM port from earlier and set the baud rate to `460800`

![](https://github.com/iamromulan/quectel-rgmii-configuration-notes/blob/main/images/portbauadqflash.png?raw=true)

Step 5.
> Load modem firmware (previously unpacked from the archive) into the program.

![](https://github.com/4IceG/Personal_data/blob/master/5G/fwinst/qfb.png?raw=true)

> In the new window, go to the `\update\firehose` folder and select file `partition_complete_p4K_b256K.mbn`. Then click the Open button.

![](https://github.com/4IceG/Personal_data/blob/master/5G/fwinst/qf2.png?raw=true)

Step 6.
> Start updating modem firmware.

![](https://github.com/4IceG/Personal_data/blob/master/5G/fwinst/qf3.png?raw=true)

</details>

<details>
   <summary>Linux (OpenWrt) | View</summary>

Step 1.
> Install the qfirehose package.
> In console, run commands.

``` bash
opkg update
opkg install qfirehose
```
Step 2.
> Using WinSCP, copy the extracted modem firmware to the \tmp folder on the router.

Step 3.
> Start updating modem firmware.
> In console, run command.

``` bash
/usr/bin/qfirehose -f /tmp/RM520NGLAAR03A02M4GA
```

</details>

## How to use Qnavigator to send AT commands

<details>
   <summary> View</summary>

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

</details>

## AT commands:
<details>
   <summary>View</summary>


| Date | Version | Link |
| --- | --- | --- |
| `2024-02-07` | *RG520N&RG525F&RG5x0F&RM5x0N&RM521F Series* | <a href="https://mega.nz/file/2IlSVTAZ#y10u-uxWGo9afvAI54jO4JpMLLjpoFGLINVaUC49ZQY">View/Download</a> |
| `2023-07-31` | *RG520N&RG525F&RG5x0F&RM5x0NSeries* | <a href="https://mega.nz/file/zEEmCYTb#Y_YVlSEWNn9tz9dpHvY1rSZuDR_gEB6XEVIQ0nGrCJQ">View/Download</a> |
| `2022-08-12` | *RG520N&RG52xF&RG530F&RM520N&RM530NSeries* | <a href="https://mega.nz/file/zIllzT7S#leMbHiKL_jmEy2LZMp1-3aI2BLW2m8vkNFl8ApT3FQw">View/Download</a> |
| `2021-08-09` | *RG50xQ&RM5xxQ Series* | <a href="https://mega.nz/file/mVNRXZrI#FS1_8YIZgqEEcyjWG1__RMI5IeiTc6yrwU9xw6bCpsQ">View/Download</a> |
| `2020-10-09` | *RG50xQ&RM5xxQ Series* | <a href="https://mega.nz/file/nIlhFBhS#QuJZIaN0EkBvLYqFhSUCv_qjx0aGsSG04VXUp1huATw">View/Download</a> |

</details>


## Other Docs
<details>
   <summary>General</summary>

<a href="https://www2.quectel.com/5GLTEAdvance">[NEW!] Quectel 5G&LTE-Advanced Module Product Overview V7.1</a>

<a href="https://mega.nz/file/TI9yHTjL#iJVMKIMRH-gaIwoSZkUDgmAU3s9hjL3I1brFHeV0t-I">Quectel Product Brochure V7.4</a>

<a href="https://mega.nz/file/HMsgAI7Q#kVLf7ETrE13zrsUUmdq2NUe2d26ZSkbeqgmNXQ4offw">QCOM User Guide V1.1</a>

<a href="https://mega.nz/file/bQsw1YqS#c2j1rqAvUZRAhQUniaHfUD0CZZNvxtusW12eIgReDzI">QFlash User Guide V5.0 </a>

<a href="https://mega.nz/file/fRlBgSDb#zusk1tH29-4HGu9tJJfxkpARlbo-LBwz3h4Bqk9qTEI">[Updated!] Quectel RM520N-GL Hardware Design</a>

<a href="https://mega.nz/file/TcdFgJhQ#C6zNX0rSsrLOFy5bqUk5fnPZ-W7vFQBvh8gVyOxfNmk">[NEW!] Reference Design</a>

<a href="https://mega.nz/file/vAcmWAzK#3IkjR9WLL9BQjKV9SEvDsuNgp-g0Bbm-TcLtRqMR6H8">[NEW!] A/B System Update Guide</a>

<a href="https://mega.nz/file/zAcUEIDL#_qEpH1C3rmDpaKFTUyud4zQY88pUEKrHhN1-qzY21bE">[NEW!] DFOTA Upgrade Process</a>

<a href="https://mega.nz/file/Oc1C1DIQ#mucxYGBrauLJAhQUKDuIB9cb_ETuod743XE_eb-boqE">[NEW!] TCP/IP Application Note</a>

<a href="https://mega.nz/file/KV1XSYAT#sKN5N1HPjHETpk06zi7s_FXGNR2HaxIp4Qbw_cmy3Vc">[NEW!] Data Call Application Note</a>

<a href="https://mega.nz/file/CN1HQKyb#18bN9uZKJf6zInXDhsLWMW1mlP2tkM_QpC1X8i9r_v8">[NEW!] eSIM LPA Application Note 1.1</a>

<a href="https://mega.nz/file/KU1QWYzC#9CB5ikUD6-YtcUzjaACEeA3YobYJXUhddalFRZ1KTZ4">[NEW!] eSIM LPA Application Note 1.0</a>

<a href="https://mega.nz/file/aBkDSQAK#JMy2f4n-hMfDHoFbc6uQkOpr-lhc58v6Kqp0-NUH8rE">[NEW!] Voice Over ttyUSB Application Note</a>

<a href="https://mega.nz/file/KAkFyTJQ#GekOQec5Ma2THtbQRQWfsK9_z6pGpFHe1XYxS1wMw-g">[NEW!] External VoLTE stack Application Note</a>

<a href="https://mega.nz/file/jUEzlYaT#4ayxXXgZ62yr4qUPMneocvm_1ZhZ_N9y1mclvi5rrv4">[NEW!] File Application Note</a>

<a href="https://mega.nz/file/fY1w3QIK#XyrfW-cIHq30ZsLwFS7pJxc-6ZwAAP32Omh7IPLbSeY">[NEW!] GNSS Application Note</a>

<a href="https://mega.nz/file/nc810Jhb#gsnFEC8vhGYV_IY6boIKraz-aTnIr8oFOoAuph6lndM">[NEW!] HTTP(S) Application Note</a>

<a href="https://mega.nz/file/6cNWERgL#hNHEBKAbLoZzzUoBxdzHmyH_TR9cAV1gM5SCCyKLlHA">[NEW!] Software Thermal Management Guide</a>

<a href="https://mega.nz/file/bJE1zbDQ#gj1-4KrFbhLLbSUaoaKNhbVRz7M-X5beMXFcwwbyGss">[NEW!] Thermal Design Guide</a>

<a href="https://mega.nz/file/aIsWgKRB#n7YcwAsreFfCYTcTw0Vk06Y0EQk6yYwa8AwP1IMuRHQ">[NEW!] 5G Network Status Judgement Introduction</a>

<a href="https://mega.nz/file/HIMRkAwA#7O19pLJwHKF2cYRs_y68sKo2Vd7HmjRmmBrnUOFrSuo">[NEW!] CA Combos Spreadsheet</a>

</details>

<details>
   <summary>[NEW!] QuecOpen</summary>

<a href="https://mega.nz/file/LRVDDYCQ#VFARx9j_0g43LaBS_-4IPDjQwAR55dePl4eVgFQcGXY">DFOTA Generation Tool Directions </a>

<a href="https://mega.nz/file/qBt3jTBD#f7KaTzcHwtDhBO6pmucQUqjfUh2Ue91ywMasldNrCh4">[NEW!] FullFOTA Update Guide</a>

<a href="https://mega.nz/file/LNMUAarY#auGqgn3m-6_s1v3jOQ3W7YiqfKU_2Obn5mGMzbtPXzY">[NEW!] Virtual Port Programming for AT Command Sending and Receiving Guide</a>

<a href="https://mega.nz/file/nQdUlS5S#u9NCOPapYfc6LlCzC2SYSPKORokG3NGMwV7L7u_cjRM">[NEW!] Device Management and Cellular Network Development Guide</a>

<a href="https://mega.nz/file/3d1HlKYL#j3dEHFOHTpaMbogDgn2WCRSiilWNMzila21eZHwvmok">[NEW!] Linux System Time Synchronization Guide </a>

<a href="https://mega.nz/file/mdkU1b6A#gjq-N6__TMZrSTe4oXurworrwDlUsCDCCHJg-pQ2fXk">[NEW!] Open-Source Software Package Cross-Compilation Guide</a>

<a href="https://mega.nz/file/uQ0BkS5Z#uaSgFc8yEbHKuS0_vefbVeeZHEVsfJ27PhehivArQcw">[NEW!] SIM and SMS Development Guide</a>

<a href="https://mega.nz/file/6Q1Q0R5Z#WQyE8ab0PgTkFQDeV_g5qxDom-4KQB2vyvqARyEG09o">[NEW!] Upgrade via LAN Application Note</a>

</details>

## Description of antenna connection:
<details>
   <summary>View</summary>
 
![](https://github.com/4IceG/Personal_data/blob/master/5G/antenasmall.png?raw=true)
![](https://github.com/4IceG/Personal_data/blob/master/5G/rm520n-gl.PNG?raw=true)

</details>

## Specification:
![](https://github.com/4IceG/Personal_data/blob/master/5G/quectel_rm520n-gl_5g_specification_v1-0-0_preliminary_20210915-1.png?raw=true)
![](https://github.com/4IceG/Personal_data/blob/master/5G/quectel_rm520n-gl_5g_specification_v1-0-0_preliminary_20210915-2.png?raw=true)

