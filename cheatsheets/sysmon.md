# Sysmon 
_System Monitor_ is a Windows system service and device driver for monitoring and logging of system activity. Sysmon writes events to the event log in **Applications and Services Logs/Microsoft/Windos/Sysmon/Operational**. These events enable detailed analysis of malicious activity across the network. _(all information is taken from official documentation)_

## Install
Download from [Sysinternals](https://docs.microsoft.com/en-us/sysinternals/) and unzip it to any location.

In an elevated command shell:
```shell
REM Install
sysmon.exe -accepteula -i <path to config file>

REM Change configuration on existing installation
sysmon.exe -c <path to new config file>

REM Display current configuration
sysmon.exe -s

REM Uninstall
sysmon.exe -u [force]
```

## Events
ID | Name
---|------
1 | Process creation
2 | A process changed a file creation time
3 | Network connection
4 | Sysmon service state changed
5 | Process terminated
6 | Driver loaded
7 | Image loaded
8 | CreateRemoteThread
9 | RawAccessRead
10 | ProcessAccess
11 | FileCreate
12 | RegistryEvent (Object create and delete)
13 | RegistryEvent (Value Set)
14 | RegistryEvent (Key and Value Rename)
15 | FileCreateStreamHash
17 | PipeEvent (Pipe Created)
18 | PipeEvent (Pipe Connected)
19 | WmiEvent (WmiEventFilter activity detected)
20 | WmiEvent (WmiEventConsumer activity detected)
21 | WmiEvent (WmiEventConsumerToFilter activity detected)
22 | DNSEvent (DNS query)
255 | Error
