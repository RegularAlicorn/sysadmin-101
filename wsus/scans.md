# Scanning for Updates
Scanning for Windows Updates does not scale well with UI interactions. Also sometimes you will need to either fix broken updates, test updates or start updates immediately. The first step is to automate updates with group policies on a bigger scale. For special cases you can use the following tools.

## Wuauclt.exe
Windows Update Automatic Update Client (_wuauclt_) is included up until **Windows 7 and Server 2012R2**. 

Command | Description
--------|------------
/ReportNow | Status report to the Wsus server
/DetectNow | Detect available updates, udpate settings like download apply
/UpdateNow | Install available updates
/ShowWindowsUpdate | Opens the Windows Update dialog box
/ResetAuthorization | Deletes current SUS ID (WSUS SID)
/SelfUpdateManaged | Scan for available updates using Wsus
/SelfUpdateUnmanaged | Scan for available update using Online Windows Updates

### Examples
1. Detect updates and install right away `wuauclt /detectnow /updatenow` 
2. Report current state to wsus, then find new updates 
  ```shell
  wuauclt /reportnow
  wuauclt /detectnow
  ```
3. Fix Wsus detection
  ```shell
  @echo off

  echo Force Windows Update Detection from the AU client:

  REM Stop services
  net stop wuauserv /y
  net stop bits /y

  REM Delete associated directories
  rmdir C:\Windows\SoftwareDistribution /S /Q
  del C:\Windows\WindowsUpdate.log /S /Q

  REM Delete registry entries
  REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v AccountDomainSid /f
  REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v PingID /f
  Reg DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /f

  REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientValidation /f

  REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v LastWaitTimeout /f
  REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v DetectionstartTime /f
  REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v NextDetectionTime /f

  echo Register Windows Update components

  regsvr32.exe c:\windows\system32\wuweb.dll /s
  regsvr32.exe c:\windows\system32\wuapi.dll /s
  regsvr32.exe c:\windows\system32\wuaueng.dll /s
  regsvr32.exe c:\windows\system32\wuaueng1.dll /s
  regsvr32.exe c:\windows\system32\wucltui.dll /s
  regsvr32.exe c:\windows\system32\msxml3.dll /s
  regsvr32.exe c:\windows\system32\wups2.dll /s
  regsvr32.exe c:\windows\system32\wups.dll /s

  REM Restart services
  net start wuauserv /y
  net start bits /y

  echo Initiating Windows Updates detection

  wuauclt.exe /resetauthorization
  wuauclt.exe /detectnow
  wuauclt.exe /reportnow
  ```
  
## UsoClient.exe
The _UsoClient_ was newly added with **Windows 10 and Server 2016** and replaces wuauclt.exe completely. Windows 10, Server2016, and newer will have Powershell 5 installed by default. Powershell 5+ is a better way to handle Windows Updates at scale, the _Usoclient_ is for special cases helpful.

_Parameters for Usoclient neither use dash (-) nor slash (/) as a prefix_

Command | Description
--------|------------
StartScan | Scan for available updates, update settings like downloads apply
StartDownload | Download available updates
StartInstall | Install available updates
RestartDevice | Restart computer to finish update installation
RefreshSettings | Apply setting changes
ResumeUpdate | Continues updates on the next boot
