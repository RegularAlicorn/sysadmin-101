# Netsh
Netsh is a command-line tool to handle network configuration of your Windows computer. It is natively included since Windows 2000.

## How can you call netsh.exe?
Any open cmd.exe, the "run" dialog or start menu search can natively call netsh.exe. It is located in system32 an thus automatically loaded

## How can you change the mtu (maximum transmission unit) value?
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

## VMWare virtual NICs
There are some issues with NICs in virtual machines of hardware version 11 (see https://kb.vmware.com/s/article/2129176). These issues might delay packets for up to half a second.
To check your NICs run ``netsh int tcp show global`` and make sure the Receive Segment Coalescing State is set to __disabled__.
If this is not the case, disable RSC globally with ``netsh int tcp set global rsc=disabled``

## How do you reset the network stack?
Run the following commands to reset your network stack. Be careful, this resets your IP configurations!
```
netsh winsock reset
netsh int ip reset
```

## Traces

### How can you start a network traffic trace with Windows native tools?
Netsh has tracing capability. A basic trace saved to local app data can be created with the command below.
```
REM Start trace
netsh trace start capture=yes
REM Stop trace
netsh trace stop
```
Capturing a trace will generate an .etl (event trace log) file with binary networking data and a .cab for additional information. By default the file will be saved in __%LocalAppData%/Temp/NetTraces/__ (you can change this with the "traceFile" parameter).net

### How can you view an event trace log?
* Convert it to an xml-File with ``netsh trace convert dump=xml`` (Other formats available, i.e. csv,evtx,txt)
* Open it with Microsoft Message Analyzer

### Can you monitor specific ports?
You can see which providers your Windows Version includes to have easy access to port monitoring.
```
netsh trace show providerFilterHelp 
```
"Microsoft-Windows-TCPIP" enables you to create port specific monitoring scenarios.
```
netsh trace start
             provider=Microsoft-Windows-TCPIP
             providerFilter=Yes
             TCP.SourcePort=80 TCP.DestinationPort=443
netsh trace start
             provider=Microsoft-Windows-TCPIP
             providerFilter=Yes  TCP.SourcePort=!(0-1000)
```

### Are there more filter possiblities other than predefined ones?
To see available filters and syntax use ``netsh trace show CaptureFilterHelp``.
If you want to only trace IPv4 for a specific address use ``netsh trace start capture=yes Ethernet.Type=IPv4 IPv4.Address=10.0.0.1``

### Can you only capture message for specific systems?
* You can check available scenarios with ``netsh trace show scenarios`` 
  * To debug fileshare and printers use ``netsh trace start capture=yes Scenario=FileSharing``
* You can check available providers with ``netsh trace show providers``
* You can check available interfaces with ``netsh trace show interfaces``
  * Restrict traffic to an interface with ``netsh trace start capture=yes CaptureInterface='{Interface-GUID}'``

All filters are combinable to create a complex trace with minimal noise.
