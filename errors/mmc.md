# Errors with MMC.exe

## WSUS snapp-in
**Problem:** The MMC showed the following error while trying to approve some update. It started happening without anything notice and no change what-so-ever:

`System.ComponentModel.InvalidEnumArgumentException - The value of argument 'firstExplicitApprovalAction' (3) is invalid for Enum type 'UpdateApprovalAction'.`

**Fix:** This seems to be a temporary error which is fixed by restarting the console. If this is not helping, you may delete the WSUS configuration file for mmc in __%appdata%/Microsoft/mmc__ and restart the console.

## Taskschd
**Problem:** Starting a task you get the error _"The user account does not have permission to run this task."_
**Fix:** This can be due to bad permissions on the actual task. Navigate to _C:\Windows\System32\Tasks_ find the corresponding task and set the _"Administrator"_ permissions to atleast Read&Execute.
