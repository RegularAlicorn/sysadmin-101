# Printer
If the spooler is crashing on a regular basis, the most likely reason is a bad driver.
Not in all cases is the newest driver the best one, try older ones aswell.

## Find Driver based on Event
In the Application Event Log you will get events ID 1000 which contain driver names you can search for with powershell. Associated executables are spoolsv.exe, pc-print.exe, printisolationhost.exe and splwow64.exe.
Check the **Faulting module name** for the driver binary name.
```powershell
Get-PrinterDriver | ? {$_.ConfigFile -like "*<NAME>*" -or $_.DependentFiles -like "*<NAME>*" -or $_.Monitor -like "*<NAME>*"}
```

