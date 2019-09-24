# Logon Types
Windows knows different types of authentications, which can be monitored through policies.

If enabled, it will create an security event
* Successful: 528, 540
* Failed: 529 - 537, 539

The following Logon Types exist and should be understood as different actions:

ID | Name | Description
---|------|------------
2 | Interactive logon | Local system UI logon or RunAs without /netonly
3 | Network logon | Remote file share/printer access, non-basic authentication IIS service access
4 | Batch logon | Console access, the task scheduler uses these
5 | Service logon | Services and service accounts
7 | Unlock | Unlocking of a Windows machine
8 | Network clear text logon | Clear text password network authentication (e.g. basic authentication to an IIS instance)
9 | New credentials based logon | RunAs /netonly, creates the app with local user identity but network with given (different) credentials
10 | Remote interactive logon | RDP authentication, e.g. Remote Desktop, Terminal Services, and Remote Assistance
11 | Cached Interactive logon | logon without DC connection
