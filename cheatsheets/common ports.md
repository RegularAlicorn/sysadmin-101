# Common Ports
Protocols typically have a known port to work on. This is not enforced and actually often is abused by malicious parties by using a known open port (e.g. 80) to send their data through.

Optional transport protocol (tcp/udp) in (round brackets)

Port | TCP/UDP | Protocol | Comment
---|---|---|---
7 | TCP/UDP | [Echo](https://en.wikipedia.org/wiki/Echo_Protocol) | .
9 | UDP | [Wake-on-LAN](https://en.wikipedia.org/wiki/Wake-on-LAN) | Unofficial
20/21 | TCP (UDP) | [FTP](https://en.wikipedia.org/wiki/File_Transfer_Protocol) | _Unsafe, do not use_
22 | TCP (UDP) | [SSH](https://en.wikipedia.org/wiki/Secure_Shell) | .
23 | TCP (UDP) | [Telnet](https://en.wikipedia.org/wiki/Telnet) | _Unsafe, do not use_
25 | TCP | [SMTP](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol) | .
42 | TCP | [WINS](https://en.wikipedia.org/wiki/Windows_Internet_Name_Service) | .
53 | TCP/UDP | [DNS](https://en.wikipedia.org/wiki/Domain_Name_System) | .
67/68 | UDP | [DHCP](https://en.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol) | .
80 | TCP | [HTTP](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol) | .
88 | TCP | [Kerberos](https://en.wikipedia.org/wiki/Kerberos_(protocol)) | .
123 | UDP | [NTP](https://en.wikipedia.org/wiki/Network_Time_Protocol) | .
137-139 | TCP/UDP | [NetBIOS](https://en.wikipedia.org/wiki/NetBIOS) | .
161/162 | TCP/UDP | [SNMP](https://en.wikipedia.org/wiki/Simple_Network_Management_Protocol) | .
443 | TCP | [HTTPS](https://en.wikipedia.org/wiki/HTTPS) | .
445 | TCP | [SMB](https://en.wikipedia.org/wiki/Server_Message_Block) | .
