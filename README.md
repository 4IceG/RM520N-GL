# RM520N-GL
Quectel RM520N-GL is 5G IoT module specially optimized for IoT/eMBB applications. You will find Tools, Docs, and Firmware for it here.
## Windows Autoinstaller:
**[RM520 Resource Package DOWNLOAD](https://drive.google.com/file/d/1aoDb2oOpojMr-3OixEe32CO2IRffDBPE/view?usp=sharing)**

**Note**

Unfortunately due to GitHub's 100MB per file limit, Qflash 6.4 and the firmware directory couldn't be uploaded to the repository. It is however included in the latest [RM520 Resource Package](https://drive.google.com/file/d/1aoDb2oOpojMr-3OixEe32CO2IRffDBPE/view?usp=sharing)

**What this does**

Proceeding yes with any option will create C:\Quectel\

It's a yes/no .cmd file that when ran, requests administrative privileges, then asks to extract and run the NDIS 2.4.6 driver installer (y/n), asks to install QFlash 6.4 (y/n), asks to copy over the 2 latest firmware zips (that this repository has) to C:\Quectel\firmware (y/n), then asks to install Qnavigator V1.6.10 (y/n)
* All are installed to C:\Quectel\
* Installing Qflash will create a firmware folder and a flash folder in C:\Quectel\ (flash meant for what you are flashing; firmware meant for your firmware zips)
* Installing Qflash and/or Qnavigator will create desktop and start menu shortcuts 

**Directions**
* Extract zip file anywhere
* Run  `RM520utilitiesINSTALLER.cmd`
* Press y or n (yes or no) to respond to each question
## How to install firmware with Qflash (Windows) : 
### If you installed by using the autoinstaller: 
C:\Quectel\firmware to store your firmware zips was created and C:\Quectel\flash was created to flash the firmware from.
Firmware is packed up in a .zip file like this: `RM520NGLAAR01A07M4G_01.203.01.203`
#### 1. Open your firmware .zip and copy the `update` folder to C:\Quectel\flash 
* Or just somewhere with no spaces in the folder name on any folder on the way to it (For example: C:\Quectel\flash will work  C:\Qu ectel\fla sh will not work)
#### 2. Open device manager, go to ports, take note of what the port number is for the DM port. ![COM ports](https://github.com/iamromulan/RM520N-GL/blob/main/readmeimages/ports.png?raw=true)
* In this case the DM port is port 11
 #### 3. Open Qflash, under COM port set it to the DM port. In my case it was 11 so I will use 11. Set the baudrate to 460800. ![COMandBAUD](https://github.com/iamromulan/RM520N-GL/blob/main/readmeimages/portbauadqflash.png?raw=true)
#### 4. Click Load FW files, then go to the update folder you copied from your firmware zip, go to firehose, then select/open the "prog firehose" file. ![selectPROGfirehose](https://github.com/iamromulan/RM520N-GL/blob/main/readmeimages/selectprogfirehose.png?raw=true)
#### 5. Click Start! The firmware will flash and the modem will reboot. After it reboots and comes back up Qflash should say "PASS" indicating it was successful.
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

## Firmware:
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


## AT commands:
<a href="https://github.com/iamromulan/RM520N-GL/blob/main/Documents/Quectel_RG520N%26RG525F%26RG5x0F%26RM5x0N_Series_AT_Commands_Manual_V1.0.0_Preliminary_20230731.pdf" title="Quectel RM520N AT Commands Manual V1.0.0">Quectel RM520N AT Commands Manual V1.0 
(2023-07-31)</a>

<a href="https://github.com/iamromulan/RM520N-GL/blob/main/Documents/Quectel_RG520N%26RG52xF%26RG530F%26RM520N%26RM530N_Series_AT_Commands_Manual_V1.0.0_Preliminary_20220812.pdf" title="Quectel RM520N AT Commands Manual V1.0.0">Quectel RM520N AT Commands Manual V1.0 
(2022-08-12)</a>

<a href="https://github.com/iamromulan/RM520N-GL/blob/main/Documents/Quectel_RG50xQ_RM5xxQ_Series_AT_Commands_Manual_V1.2_20210809.pdf" title="Quectel RM520N AT Commands Manual V1.2">Quectel RM520N AT Commands Manual V1.2
(2021-08-09)</a>

<a href="https://github.com/iamromulan/RM520N-GL/blob/main/Documents/Quectel_RG50xQ%26RM5xxQ_Series_AT_Commands_Manual_V1.1.1_Preliminary_20201009.pdf">Quectel RM520N AT Commands Manual V1.1 
(2020-10-09)</a>

## Description of antenna connection:
![](https://github.com/4IceG/Personal_data/blob/master/5G/antenasmall.png?raw=true)
![](https://github.com/4IceG/Personal_data/blob/master/5G/rm520n-gl.PNG?raw=true)

## Specification:
![](https://github.com/4IceG/Personal_data/blob/master/5G/quectel_rm520n-gl_5g_specification_v1-0-0_preliminary_20210915-1.png?raw=true)
![](https://github.com/4IceG/Personal_data/blob/master/5G/quectel_rm520n-gl_5g_specification_v1-0-0_preliminary_20210915-2.png?raw=true)
