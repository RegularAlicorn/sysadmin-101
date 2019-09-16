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
Import-Module ADSync
Start-ADSyncSyncCycle -PolicyType Delta
```

### Instant object synchronization
```powershell
Get-ADDomainController -Filter * | ForEach-Object {Sync-ADObject -Object <object DN> -Source <DC hostname> -Destination $_.name}
```
