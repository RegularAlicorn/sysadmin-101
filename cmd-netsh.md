## Netsh
Netsh is a command-line tool to handle network configuration of your Windows computer. It is natively included since Windows 2000.

# How can you call netsh.exe?
Any open cmd.exe, the "run" dialog or start menu search can natively call netsh.exe. It is located in system32 an thus automatically loaded

# How can you change the mtu (maximum transmission unit) value?
For rare cases it is helpful or necessary to change the maximum transmission unit value. Generally does a higher value decrease the overhead and a lower value lessens the strain on a slow data-link.
You can see current mtu for any interface with the following command 
```
netsh int ipv4 show sub
netsh int ipv6 show sub
```
If you need to change any of those mtu values, you note down the name and set it with
```
netsh int ipv4 set sub mtu=1280 store=persistent
```
The persistent parameter makes sure it is keept through reboots.
