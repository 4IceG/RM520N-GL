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
![COM ports](https://github.com/iamromulan/quectel-rgmii-configuration-notes/blob/main/images/repocmd.png?raw=true)

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
 #### 5. Click Start! The firmware will flash and the modem will reboot. After it reboots and comes back up Qflash should say "PASS" indicating it was successful.

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
<a href="https://drive.google.com/file/d/1nB-yBeqBCMLUXKLWNYVxs8VX6AXw9eOn/view?usp=sharing" title="Quectel_Windows_USB_DriverQ_NDIS_V2.4.6">Quectel Windows USB Driver(Q) NDIS V2.4.6</a> 
(Included in Autoinstaller)

<a href="https://drive.google.com/file/d/1UAgRqwF_ygA5USnoJLXfBhvlh5NrNgke/view?usp=sharing" title="Quectel_Windows_USB_DriverQ_NDIS_V2.4.6">Quectel Windows USB Driver(Q) MBIM V1.3.1</a>

<a href="https://www.waveshare.com/w/upload/d/df/Quectel_Windows_USB_Driver%28Q%29_RNDIS_V1.0.9.zip" title="RNDIS_V1.0.9.zip">Quectel Windows USB Driver(Q) RNDIS V1.0.9</a>

[QFlash V6.4 EN](https://drive.google.com/file/d/13a4-8IZF5sAWAiC8hf6OKdC1wjtAVaF_/view?usp=sharing)
(Included in Autoinstaller)

<a href="https://drive.google.com/file/d/1j3Wy_znL2ajt2_Rc4gejgoJRcp8ieQLm/view?usp=sharing" title="QFlash.V5.8.EN">QFlash V5.8 EN</a>

<a href="https://github.com/4IceG/RM520N-GL/blob/main/Toolz/QFirehose_Linux_Android_V1.4.15.zip" title="QFirehose_Linux_Android_V1.4.15">QFirehose V1.4.15</a>

<a href="https://github.com/4IceG/RM520N-GL/blob/main/Toolz/QFirehose_Linux_Android_V1.4.11.zip" title="QFirehose_Linux_Android_V1.4.11">QFirehose V1.4.11</a>

<a href="https://drive.google.com/file/d/1Gx1Ab5uLSAOaIlWzKHS17qE3Wo9hVQ7i/view?usp=sharing" title="Qnavigator_V1.6.10">Qnavigator V1.6.10</a>
(Included in Autoinstaller)

<a href="https://drive.google.com/file/d/1_s2tsLvVxjqN16O672-2sdwD6DZsmw9j/view?usp=sharing" title="Qnavigator_V1.6.9.1.zip">Qnavigator V1.6.9.1</a>

<a href="https://drive.google.com/file/d/1xVw5IBowlKn7HPqfyYfoZdBx1p5Xs7aU/view?usp=sharing" title="QCOM_V1.6">QCOM V1.6</a>

## Stock Firmware
<a href="https://drive.google.com/file/d/12H3eFDhQg2ZTavlqMZiWO0OJ-pLozfWL/view?usp=sharing">RM520NGLAAR01A08M4G_01.200.01.200
 (2023-07-20)</a> (Included in Autoinstaller)

<a href="https://drive.google.com/file/d/1CjuJyeSIjM8Mh0aNL-nk7f1nryyQrE-U/view?usp=sharing" title="RM520NGLAAR01A07M4G_01.203.01.203">RM520NGLAAR01A07M4G_01.203.01.203 
(2023-07-12)</a> (Included in Autoinstaller)

<a href="https://drive.google.com/file/d/18mtwvYxl7BfAwTkFO6j6IhY27oZwonGa/view?usp=sharing" title="RM520NGLAAR03A01M4G_01.202.01.202">RM520NGLAAR03A01M4G_01.202.01.202 
(2023-05-12)</a>

<a href="https://fw.gl-inet.com/tools/quectel_module_software/RM520NGLAAR01A07M4G_01.201.01.201.zip" title="RM520NGLAAR01A07M4G_01.201.01.201">RM520NGLAAR01A07M4G_01.201.01.201 
(2023-03-27)</a>

<a href="https://drive.google.com/file/d/1hlFwz7UbC5mnwsF1ihCEaElTxrdIdnGk/view?usp=sharing" title="RM520NGLAAR01A06M4G_12.001.12.001">RM520NGLAAR01A06M4G_12.001.12.001 
(2023-01-20)</a>

<a href="https://drive.google.com/file/d/1NWle7w6LHubee5l4n7EsMuExtVj36lwV/view?usp=sharing" title="RM520NGLAAR01A06M4G_01.200.01.200 2">RM520NGLAAR01A06M4G_01.200.01.200 
(2022-12-26)</a>

## Custom Firmware
#### Firmware for use in RGMII setups:
[Arixolink RM520NGLAAR03A01M4G OCPU_BETA_20230419C 
(R01.00.04_FULL_2023-11-07)](https://drive.google.com/file/d/1fNUr2U8Fn-yDcfZqaNznpfcerbijjKyo/view?fbclid=IwAR3ICR7vlvLSgOUv42ejIbsjaxq3E-kYFIzz-6r7PZZTQGXZM6azT8vcVWc)
## AT commands
<a href="https://github.com/iamromulan/RM520N-GL/blob/main/Documents/Quectel_RG520N%26RG525F%26RG5x0F%26RM5x0N_Series_AT_Commands_Manual_V1.0.0_Preliminary_20230731.pdf" title="Quectel RM520N AT Commands Manual V1.0.0">Quectel RM520N AT Commands Manual V1.0 
(2023-07-31)</a>

<a href="https://github.com/iamromulan/RM520N-GL/blob/main/Documents/Quectel_RG520N%26RG52xF%26RG530F%26RM520N%26RM530N_Series_AT_Commands_Manual_V1.0.0_Preliminary_20220812.pdf" title="Quectel RM520N AT Commands Manual V1.0.0">Quectel RM520N AT Commands Manual V1.0 
(2022-08-12)</a>

<a href="https://github.com/iamromulan/RM520N-GL/blob/main/Documents/Quectel_RG50xQ_RM5xxQ_Series_AT_Commands_Manual_V1.2_20210809.pdf" title="Quectel RM520N AT Commands Manual V1.2">Quectel RM520N AT Commands Manual V1.2
(2021-08-09)</a>

<a href="https://github.com/iamromulan/RM520N-GL/blob/main/Documents/Quectel_RG50xQ%26RM5xxQ_Series_AT_Commands_Manual_V1.1.1_Preliminary_20201009.pdf">Quectel RM520N AT Commands Manual V1.1 
(2020-10-09)</a>

## Other Docs

## Description of antenna connection
![](https://github.com/4IceG/Personal_data/blob/master/5G/antenasmall.png?raw=true)
![](https://github.com/4IceG/Personal_data/blob/master/5G/rm520n-gl.PNG?raw=true)

## Specification
![](https://github.com/4IceG/Personal_data/blob/master/5G/quectel_rm520n-gl_5g_specification_v1-0-0_preliminary_20210915-1.png?raw=true)
![](https://github.com/4IceG/Personal_data/blob/master/5G/quectel_rm520n-gl_5g_specification_v1-0-0_preliminary_20210915-2.png?raw=true)


