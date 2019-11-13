# SQL

## MSSQL

### “The target principal name is incorrect.  Cannot generate SSPI context.”
[More information in this Microsoft Support Article]{https://support.microsoft.com/en-us/help/811889/how-to-troubleshoot-the-cannot-generate-sspi-context-error-message}

This issue might occur if you use the NT-System\Networkservice account to run the database server service without a domain administrator account (this is a good thing!).

The error message in the log reads like this:
```
The SQL Server Network Interface library could not register the Service Principal Name (SPN) [ MSSQLSvc/servername.domainname.net:1433 ] for the SQL Server service. Windows return code: 0x2098, state: 15. Failure to register a SPN might cause integrated authentication to use NTLM instead of Kerberos. This is an informational message. Further action is only required if Kerberos authentication is required by authentication policies and if the SPN has not been manually registered.
```

If a database uses mirroring, it needs a domain account to function, which needs SPN Read/Write permissions on its own object.
Set the account permissions and restart the server service afterwards.

```powershell
dsacls <Service Account DN> /G SELF:RPWP;"servicePrincipalName" 
```

If it worked, the new log entry reads like this:
```
The SQL Server Network Interface library successfully registered the Service Principal Name (SPN) [ MSSQLSvc/servername.domainname.net:1433 ] for the SQL Server service.
```

There might a an issue with SPN registration, you can output all active SPN s with this command
```powershell
Get-ADUser -filter * -Properties servicePrincipalName | ?{$_.servicePrincipalName -ne ""}
```
