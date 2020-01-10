# Active Directory

## Health
If you use an active directory, then it's at the heart of your system. Everything else is - normally - built around it and needs it to function perfectly. You should run regular proactive health checks to spot errors as early as possible.

#### dcdiag.exe
_DCDIAG.exe_ is a tool to test domain controllers for functionality within a forest. You can install this with [RSAT](https://support.microsoft.com/en-us/help/2693643/remote-server-administration-tools-rsat-for-windows-operating-systems) to run it remotely or use the version on each domain controller.
```shell
# /e checks all servers in the forest
# /v outputs verbose information
# /c also runs non-standard tests
# /f redirects output to given file
DCDIAG /e /v /c /f:dcdiag.txt
```
Check the output file for "error"s and "failure"s. `DCDIAG /e /v /c /q` discretly only mentions errors and turns down the noise.
You can use PowerShell to filter the output file for interesting lines. There will be some false positives, due to names of the tests (e.g. "CheckSecurityError"-Test)
```powershell
DCDIAG /e /v /c /f:dcdiag.txt /q
Get-Content dcdiag.txt | Select-String -Pattern "error","failure","failed" -Context 2
```

#### repadmin.exe
For an overview of the replication state we can use _repadmin.exe_ - also included in _RSAT_. 
1. Run `repadmin /replsummary` for a quick overview of your domain controllers and their replication state and possibly errors
2. Run `repadmin /showrepl` to see replications attempts and whether they were successful

#### netdom.exe
To check for FSMO role holders and whether they respond we can use `netdom query FSMO`.

#### nslookup.exe
Global catalogs are important pieces within the domain controller infrastructure. We can get a list of all glocal catalogs through DNS
```shell
nslookup -querytpye=srv _gc._tcp.example.com
```

## Kerberos Tickets
Refresh AD groups membership without user logoff for Kerberos authentication. NTLM authentication requires logoff and logon.

```shell
# see current group memberships
whoami /groups

# reset local system computer AD membership, elevated console needed
# is the identifier for the local computer session
klist -lh 0 -li 0x3e7 purge

# Update policies
gpupdate /force

# reset user ticket
klist purge

# check TGT ticket for creation time
# you will need to connect to a network resource through FQDN to have it created after a purge
klist tgt
```

## Security

### ACLs
Grant Read-Write permissions for given account to itself on the attribute "servicePrincipalName". This is for example needed on computer accounts which handle SQL and register these themselves.
```powershell
dsacls <Account DN> /G SELF:RPWP;"servicePrincipalName" 
```
