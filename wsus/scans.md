# Scanning for Updates

## Wuauclt.exe
Windows Update Automatic Update Client (wuauclt) is included up until Windows 7 and Server 2012R2. This tool is a commmand utility for windows updates.

Command | Description
--------|------------
/ReportNow | Status report to the Wsus server
/DetectNow | Detect available updates, udpate settings like download apply
/UpdateNow | Install available updates
/ShowWindowsUpdate | Opens the Windows Update dialog box
/ResetAuthorization | Deletes current SUS ID (WSUS SID)*
/SelfUpdateManaged | Scan for available updates using Wsus
/SelfUpdateUnmanaged | Scan for available update using Online Windows Updates


* Possibly also needs 
```shell
reg Delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate /v PingID /f 
reg Delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate /v AccountDomainSid /f 
reg Delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate /v SusClientId /f  
reg Delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate /v SusClientIDValidation /f 
```
