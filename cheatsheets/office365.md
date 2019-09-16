# Office 365
Some Office 365 administration tips, tricks and snippets

## Exchange

### Add FullAccess permissions to an existing mailbox
```powershell
Add-MailboxPermission -Identity <existing mailbox> `
  -User <account receiving permissions> `
  -AccessRights FullAccess -InheritanceType All
```
## Azure AD

### Start sync
```powershell
Import-Module "C:\Program Files\Microsoft Azure AD Sync\Bin\ADSync\ADSync.psd1"
Start-ADSyncSyncCycle -PolicyType Delta
```
