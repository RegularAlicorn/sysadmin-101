# Health
To check for system file health, the following commands are executed in order.  
Its rare for them to find something, but if they do, they fix it and it makes things a lot better!

```shell
sfc /scannow

REM normal scan
DISM /Online /Cleanup-Image /CheckHealth

REM advanced scan
DISM /Online /Cleanup-Image /ScanHealth

REM repair
DISM /Online /Cleanup-Image /RestoreHealth
```

You can also run the dism commands from a local image. The default command will download needed files from Microsoft Servers.

```shell
DISM /Online /Cleanup-Image /RestoreHealth /Source:G:\Sources\install.wim

REM limit the use of windows update
DISM /Online /Cleanup-Image /RestoreHealth /Source:G\Sources\install.wim /LimitAccess
```
