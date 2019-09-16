# Common commands
Some commonly useful commands

## Create local user and add to local administrators in 1 Line
```shell
net user /add <userName> <password> && net localgroup administrators <userName> /add
```

## Disable sleep mode
```shell
powercfg -x -standby-timeout-ac 0
```

## Remote serial number
```shell
wmic /node:<computername> bios get serialnumber
```
