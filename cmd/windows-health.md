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


# Last resort fixing
If you tried everything and a reinstall is costly - for unknown reason - you can fire off these last-resort-commands in an eleveated command prompt and hope for the best
```
REM Only answer Microsoft ever offers in their forums, works 1 in 10mio tries.
sfc /scannow
REM Cleanup windows components, add /ResetBase if you want full cleanup
REM With /ResetBase added you won't be able to deinstall any Update!
dism /Online /Cleanup-Image /StartComponentCleanup
REM Scans component storage for errors
dism /Online /Cleanup-Image /ScanHealth
REM Tries to automatically repair errors in the component storage
dism /Online /Cleanup-Image /RestoreHealth
```
