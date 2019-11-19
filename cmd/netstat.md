# Netstat

## How can you use NETSTAT in cmd/PowerShell?
Netstat.exe is located in %systemroot%\system32 . Any binary (.exe) in this folder is automatically loaded into your cmd/PowerShell session and can be used without a path and just the name. Netstat only needs administrative privileges for some operations, hence you can  call it within a normal command prompt. To get a quick overview of typical commands, type ``netstat /?`` into a command prompt to receive a list of available commands.

## What is netstat used for?
If you type ``netstat`` into a command prompt you will receive a table of Protocol, Local Address, Remote Address and State telling you which connections happen on your system. These table rows are populated as they are used, you will need to wait for a while before it is filled.

## Can I see the binary behind a connection?
If you use ``netstat -b`` you will receive each row populated with the responsible binary - even if there are multiple!
While this can take a while to create it is worth to check out which binarys on your system create connection and on which address to which remote address.
This operation might need an elevated command prompt.

## Can netstat display routes of my system?
Use ``netstat -r`` to get your IPv4, IPv6 and static routes.

## Are the network statistics to look at?
Yes. These are mainly useful if you want to check for Errors, unknown protocols, or whether there is any data sent/received. Type ``netstat -e`` for a short list.
If you need these statistics sorted by protocol you can use ``netstat -s``, there are quite some additional rows in here.

## The remote addresses are unintuitive, how do I know where it points to?
Try ``netstat -f`` to get a full qualified domainname or ``netstat -f -b`` to even include the responsible binary aswell!

## Why is it sorted by state?
Just use ``netstat -n`` if you don't like it.

## Can I check a specific port for listening processes with PowerShell?
```powershell
Get-Process -Id (Get-NetTCPConnection -LocalPort <PortNumber>).OwningProcess
```
