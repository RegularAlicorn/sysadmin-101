# Office 365
Some Office 365 administration tips, tricks and snippets

## Exchange

### Add FullAccess permissions to an existing mailbox
```powershell
Add-MailboxPermission -Identity <account with permissions being added> `
  -User <account who will view the other account's email> `
  -AccessRights FullAccess -InheritanceType All
```
