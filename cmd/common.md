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

### Create local user and add to local administrators in 1 Line
```shell
net user /add <userName> <password> && net localgroup administrators <userName> /add
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
