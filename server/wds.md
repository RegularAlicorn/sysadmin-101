# Windows Deployment services
Windows Deployment Services (WDS) combined with Microsoft Deployment Tools (MDT) enables you to deploy client and server installations through network (PXE) with different amount of manual work. 

## Windows Core
WDS currently can **not** be deployed to Windows Server Core.

## Health Check
Get (health) information about the current WDS server and log event to Application/System
```shell
WDSUTIL /get-server /show:all /detailed
```

## Enable Logging
Logs are written to _Windows Logs\Applications and Services Logs\Microsoft\Windows\Deployment-Services-Diagnostics_

Enable tracing in the registry:
```shell
HKLM\Software\Microsoft\Tracing\WDSMGMT
Name: EnableFileTracing
Value type: REG_DWORD
Value data: 1
HKLM\Software\Microsoft\Tracing\WDSMMC
Name: EnableFileTracing
Value type: REG_DWORD
Value data: 1
```
The files will be located in _%windir%\Tracing\wdsmgmt.log_ and _%windir%\Tracing\wdsmmc.log_

To turn on logging for client components
```shell
WDSUTIL /Set-Server /WDSClientLogging /Enabled:Yes
WDSUTIL /Set-Server /WDSClientLogging /LoggingLevel:{None|Error|Warning|Info}
```
These events will be written to Windows Events.
