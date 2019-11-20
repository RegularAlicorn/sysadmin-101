# Common Events

## Shutdown
Log | ID | Use case
----|----|---------
System | 1074 | app initiated shutdown, e.g. Windows Update. Also states the user context
System | 6006 | clean shutdown
System | 6008 | improper shutdown (power loss, blue screen, ..)

## Reboot 2008R2 / 2003
If the server reboots, there will be a triplet of the following IDs within the System-Log: 6009, 6005 and 6013. Scroll through until you meet those 3 in a row.
