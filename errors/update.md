## Windows Update with WSUS
If you search for updates (Win10/Server2016+) you may get this error
```
We couldn't install updates because there's a problem with the date and time information on your device
```
1. Compare time and date on wsus and current device, should be identical. Issues should only arrive if there is a difference bigger than your maximum time difference for Kerberos
2. Check you WSUS SSL certificate, it may be invalid
