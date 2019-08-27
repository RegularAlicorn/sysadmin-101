# DNS
DNS is a vital system within any active directory installation. Most changes will effect the whole domain - atleast indirectly - and thus should be treated with caution. DNS is a slow moving system, **be patient and don't rush changes**.

## Health check
A regular health check doesn't hurt but could save you some headache.

### dnslint
[DNSlint.exe](https://support.microsoft.com/en-us/help/321045/description-of-the-dnslint-utility) is a Microsoft Tool developed by Tim Rains to help diagnose common DNS name resolution issues. Run these commands regularly and check for errors. These commands will create a HTML-Report and a TXT-Report to manually and automatically check, /no_open  prevents the .htm to be opened upon finish.
```shell
# /ad verifies replication records
# /s by-pass InterNIC whois lookup
dnslint /ad <DC IP for LDAP> /s <DNS-Server IP> /r dnslint-ad /no_open /v /t /y

# /d performs domain name tests
# /s by-pass InterNIC whois lookup
# reports a nice overview of your system and diagnoses lame delegation issues
dnslint /d <example.local> /s <DNS-Server IP> /r dnslint-d /no_open /v /t /y

# /ql custom DNS query tests - read from an input file
# /s by-pass InterNIC whois lookup
# Use "dnslint /ql autocreate" for an example query input file
# Add atleast one DNS-Server per Zone/Domain to check and any important server to reach
dnslint /ql <in-dnslint.txt> /r dnslint-ql /no_open /v /t /y
```

### dcdiag
This Microsoft tool is installed with [RSAT](https://support.microsoft.com/en-us/help/2693643/remote-server-administration-tools-rsat-for-windows-operating-systems) and does domain controller diagnoses. Part of these tests is DNS, which we can start seperately and remote.
```shell
# Output everything
dcdiag /test:dns /e /n:<example.local> > dcdiag-dns.txt

# Only output errors
dcdiag /test:dns /q /e /n:<example.local > dcdiag-dns.txt
```
You will receive a summary at the end of the file. This file gets really noisy with a bigger system, use /q for errors only.
