# Errors with MMC.exe

## WSUS snapp-in
**Problem:** The MMC showed the following error while trying to approve some update. It started happening without anything notice and no change what-so-ever:
`System.ComponentModel.InvalidEnumArgumentException - The value of argument 'firstExplicitApprovalAction' (3) is invalid for Enum type 'UpdateApprovalAction'.`
**Fix:** This seems to be a temporary error which is fixed by restarting the console. If this is not helping, you may delete the WSUS configuration file for mmc in __%appdata%/Microsoft/mmc__ and restart the console.
