# Common commands
Some commonly useful commands

### Add console output to clipboard (for pasting later)
**CLIP IS ALL CAPS**

#### Multi-Line
```shell
CMD | CLIP
ipconfig /all | CLIP
exit
```

#### Single-Line
```shell
DIR | CLIP
NET VIEW /DOMAIN:<Domain> | CLIP
DRIVERQUERY | CLIP
```

### Write console output to file
```shell
ipconfig /all > C:\temp\ipconfig.log
```

### Get all installed drivers
```shell
DRIVERQUERY
```

### Get all service states
```shell
SC QUERY
```

### Logoff CLI
Logoff current account
```shell
logoff
```

Logoff different account
```shell
query user
logoff <ID>
```

### Create local user and add to local administrators in 1 Line
```shell
net user /add <userName> <password> && net localgroup administrators <userName> /add
```

### Convert SID to Username
```powershell
(New-Object System.Security.Principal.SecurityIdentifier("S-1-5-18")).Translate([System.Security.Principal.NTAccount])
# Outputs "NT AUTHORITY\SYSTEM"
```

### Disable sleep mode
```shell
powercfg -x -standby-timeout-ac 0
```

### (Remote) serial number
```shell
wmic /node:<computername> bios get serialnumber
```
```powershell
Invoke-Command -ComputerName <Host> -ScriptBlock {
  (Get-CimInstance -ClassName Win32_bios).SerialNumber
}
```

### Start a process as a different User
```powershell
Start-Process <path to executable> -Credential <domain\samaccountname>
```

### Start MMC as different User ELEVEATED and given file to load
```powershell
Start-process powershell.exe -Credential "" -ArgumentList '-noprofile -command &{Start-Process mmc -Argument "C:\Path\To\MMC\File" -Verb RunAs -WorkingDirectory C:\}' -WorkingDirectory C:\
```

### GridView local events
```powershell
# "ogv" is an alias of Out-GridView
Get-EventLog System -Entry Error -New 250 | Out-GridView
Get-EventLog System -Entry Error -New 250 | ogv
```

### Test connection with a specific TCP port
```powershell
Test-NetConnection <remote FQDN/IP> -Port 10123 
```

### Restricted Explorer
```shell
REM open in current directory
hh.exe /?
REM open in given directory
hh.exe C:\
```

### List service authentication accounts
```powershell
Get-WmiObject -Class Win32_Service -ComputerName $computerName | Select DisplayName, StartName, State
```

### Create a shortcut with powershell
```powershell
# Define shortcut name
$lnkPath = "C:\Temp\file-name.lnk"

# wscript object
$wshShell = New-Object -comObject WScript.Shell

# create the shortcut object
$shortcut = $wshShell.CreateShortcut($lnkPath)

# set target (e.g. executed program)
$shortcut.TargetPath = "C:\Windows\System32\cmd.exe"
# arguments can't be space seperated to the TargetPath
$shortcut.Arguments = "/c `"ping 1.1.1.1 -n 15`""
# sets icon to given index in given file (exe, dll, ..)
$shortcut.IconLocation = "%SystemRoot%\System32\imageres.dll,1"
$shortcut.WorkingDirectory = "C:\Temp\"
$shortcut.Save()

# Set "Run as Administrator" Flag
$bytes = [System.IO.File]::ReadAllBytes($lnkPath)
$bytes[0x15] = $bytes[0x15] -bor 0x20 # sets byte 21 (0x15) bit 6 (0x20) TRUE
[System.IO.File]::WriteAllBytes($lnkPath, $bytes)
```

## Auto-Run programs (used by some Malware)
Get all Run and RunOnce Programs defined in the machine (run as admin) and current user (run as current user)
```powershell
# Run as Admin
Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
Get-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
# Run as User
Get-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
Get-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
```

## Poll Remaining Grace License Time for RDS (Terminal Server)
```cmd
wmic /namespace:\\root\CIMV2\TerminalServices PATH Win32_TerminalServiceSetting WHERE (__CLASS !=””) CALL GetGracePeriodDays
```

## From-Anywhere©
Shortcuts to specific tasks from search menu, explorer and run dialog.

### Access Remote Computermanagement From-Anywhere
Create a new file _"mg.cmd"_ in _%windir%_
```shell
start compmgmt.msc /computer=%1
```

### Start mstsc to a specific server From-Anywhere
Create a new file _"m.cmd"_ in _%windir%_
```shell
mstsc /v:%1
```

### Start a Program without Elevation, even if the Application wants to!
Just drag an application (.exe) onto a .bat with the following contents
```shell
cmd /min /C "set __COMPAT_LAYER=RUNASINVOKER && start "" "%1""
```

## WSL (Windows Subsystem for Linux)
### Display weather info
```shell
curl wttr.in
curl wttr.in/<city>
```
