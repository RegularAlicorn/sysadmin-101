# Common Ports
Protocols typically have a known port to work on. This is not technically enforced but agreed on and thus might be abused by malicious parties using a known open port (e.g. 80) to send their data through (in- and/or outbound).

## General ports
Optional transport protocol in (round brackets)

Port | TCP/UDP | Protocol | Comment
---|---|---|---
7 | TCP/UDP | [Echo](https://en.wikipedia.org/wiki/Echo_Protocol) | 
9 | UDP | [Wake-on-LAN](https://en.wikipedia.org/wiki/Wake-on-LAN) | Unofficial
20/21 | TCP (UDP) | [FTP](https://en.wikipedia.org/wiki/File_Transfer_Protocol) | _Unsafe, do not use_
22 | TCP (UDP) | [SSH](https://en.wikipedia.org/wiki/Secure_Shell) | 
23 | TCP (UDP) | [Telnet](https://en.wikipedia.org/wiki/Telnet) | _Unsafe, do not use_
25 | TCP | [SMTP](https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol) | 
42 | TCP | [WINS](https://en.wikipedia.org/wiki/Windows_Internet_Name_Service) | 
53 | TCP/UDP | [DNS](https://en.wikipedia.org/wiki/Domain_Name_System) | 
67/68 | UDP | [DHCP](https://en.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol) | 
80 | TCP | [HTTP](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol) | 
88 | TCP/UDP | [Kerberos](https://en.wikipedia.org/wiki/Kerberos_(protocol)) | Kerberos V5 KDC
123 | UDP | [NTP](https://en.wikipedia.org/wiki/Network_Time_Protocol) | 
135 | TCP | [RCP Windows]() | 
137-139 | TCP/UDP | [NetBIOS](https://en.wikipedia.org/wiki/NetBIOS) | 
161/162 | TCP/UDP | [SNMP](https://en.wikipedia.org/wiki/Simple_Network_Management_Protocol) | 
443 | TCP | [HTTPS](https://en.wikipedia.org/wiki/HTTPS) | 
445 | TCP | [SMB](https://en.wikipedia.org/wiki/Server_Message_Block) | named pipes
464 | TCP/UDP | [Kerberos](https://tools.ietf.org/html/rfc3244?#page-2) | Change/Set Password
465 | TCP | [SMTPS](https://en.m.wikipedia.org/wiki/SMTPS) | SMTP over TLS
514 | UDP | [Syslog RFC-3164](https://tools.ietf.org/html/rfc3164?#page-5), [Syslog RFC-5424](https://tools.ietf.org/html/rfc5424) | on Unix the ssh predated rsh also used this port, consider security
530 | TCP/UDP | [RPC](https://en.wikipedia.org/wiki/Remote_procedure_call) | 
543 | TCP | [klogin](https://web.mit.edu/kerberos/krb5-1.4/krb5-1.4.1/doc/krb5-admin/Configuring-Your-Firewall-to-Work-With-Kerberos-V5.html) | Kerberos V5 rlogin
544 | TCP | [kshell](https://web.mit.edu/kerberos/krb5-1.4/krb5-1.4.1/doc/krb5-admin/Configuring-Your-Firewall-to-Work-With-Kerberos-V5.html) | Kerberos V5 remote shell rsh
546 | UDP | [DHCPv6](https://en.m.wikipedia.org/wiki/DHCPv6) | DHCPv6 for clients
547 | UDP | [DHCPv6](https://en.m.wikipedia.org/wiki/DHCPv6) | DHCPv6 for servers
587 | TCP | [SMTP](https://en.m.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol) | 
601 | TCP | [Reliable Delivery for syslog](http://www.networksorcery.com/enp/rfc/rfc3195.txt?#page-33) | 
647 | TCP | [DHCP failover](https://tools.ietf.org/html/draft-ietf-dhc-failover-12?#page-81) | 
749 | TCP/UDP | [Kerberos]https://tools.ietf.org/html/rfc3244) | Kerberos V5 admin/changepw
829 | TCP | [CMP](https://tools.ietf.org/html/rfc4210) | Certificate Management Protocol
853 | TCP/UDP | [DNS over TLS](https://tools.ietf.org/html/rfc7858) | 
989 | TCP | [FTPS](https://en.m.wikipedia.org/wiki/FTPS) | FTPS data channel, this is **NOT** [SFTP](https://en.m.wikipedia.org/wiki/SSH_File_Transfer_Protocol)
990 | TCP | [FTPS](https://en.m.wikipedia.org/wiki/FTPS) | FTPS control channel, this is **NOT** [SFTP](https://en.m.wikipedia.org/wiki/SSH_File_Transfer_Protocol)
993 | TCP | [IMAPS](https://en.m.wikipedia.org/wiki/Internet_Message_Access_Protocol) | IMAP over TLS
1433 | TCP/UDP | [MSSQL](https://en.m.wikipedia.org/wiki/Microsoft_SQL_Server) | MSSQL server
1434 | TCP/UDP | [MSSQL](https://en.m.wikipedia.org/wiki/Microsoft_SQL_Server) | MSSQL monitor
1512 | TCP/UDP | [WINS](https://en.m.wikipedia.org/wiki/Windows_Internet_Name_Service) | central mapping of NetBIOS names to network adresses
1812 | TCP/UDP | [RADIUS](https://en.m.wikipedia.org/wiki/RADIUS) | RADIUS authentication protocol
1813 | TCP/UDP | [RADIUS](https://en.m.wikipedia.org/wiki/RADIUS) | RADIUS accounting protocol
2049 | TCP | [NFS](https://en.m.wikipedia.org/wiki/Network_File_System) | 
2105 | TCP | [eklogin](https://web.mit.edu/kerberos/krb5-1.4/krb5-1.4.1/doc/krb5-admin/Configuring-Your-Firewall-to-Work-With-Kerberos-V5.html) | Encrypted Kerberos V5 rlogin
3020 | TCP | [CIFS](https://en.m.wikipedia.org/wiki/Common_Internet_File_System) | 
3074 | TCP/UDP | [Games for Windows - Live](https://en.m.wikipedia.org/wiki/Games_for_Windows_%E2%80%93_Live) | _Block this_
3799 | UDP | [Radius](https://en.m.wikipedia.org/wiki/RADIUS) | RADIUS change of authorization
5201 | TCP/UDP | [Iperf3](https://software.es.net/iperf/faq.html) | not supported on windows, use iperf2
6514 | TCP | [Syslog over TLS](https://tools.ietf.org/html/rfc5425?#page-5) | 
6516 | TCP/UDP | [Windows Admin Center](https://en.m.wikipedia.org/wiki/Windows_Admin_Center) | 
6771,6881-6999 | TCP/UDP | [BitTorrent](https://en.m.wikipedia.org/wiki/BitTorrent) | _Monitor this_
8008 | TCP/UDP | [HTTP](https://en.m.wikipedia.org/wiki/HTTP) | Alternative port
8080 | TCP/UDP | [HTTP](https://en.m.wikipedia.org/wiki/HTTP) | Alternative port
8332,8333,18333 | TCP/UDP | [BITCOIN](https://bitcoin.org/en/full-node) | _Monitor this_
9030,9150 | TCP/UDP | [TOR](https://en.m.wikipedia.org/wiki/Tor_(anonymity_network)) | 
12975,32976 | TCP | [LogMeIn Hamachi](https://en.m.wikipedia.org/wiki/LogMeIn_Hamachi) | _Monitor this_, will fall back to 443 if blocked. Connects to _bibi.hamachi.cc_. Clients receive addresses in _25.0.0.0/8_ (old Version in _5.0.0.0/8_)

## Windows specific
There is an extensive [Technet article](https://support.microsoft.com/en-us/help/832017/service-overview-and-network-port-requirements-for-windows) which should be used to gather needed information.
