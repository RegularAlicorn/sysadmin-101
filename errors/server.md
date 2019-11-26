# Server errors
(Some) server errors are difficult to debug. You will need to follow small leads, apply general system knolwedge and have to have a bit luck aswell.
Some typical places to look at are:
1. Event Viewer "eventvwr.msc"
    * Check System, Application or special logs in Microsoft\Windows\..
2. Windows Error Reporting (WER)
    * This folder is located in "C:\ProgramData\Microsoft\Windows\WER"
    * You can follow crashes, non-response and kernel faults. Check ReportQueue and ReportArchive folders. The folder name may suggest the affected service.
3. Windows Update ```powershell Get-WindowsUpdateLog```
    * Starting Windows 10, you will have to generate the update logs Just in Time with above PowerShell cmdlet
4. Windows Logs C:\Windows\Logs
5. More Windows Logs C:\Windows\System32\LogFiles
6. Firewall Logs C:\Windows\System32\LogFiles\Firewall
    * You will have to turn this on (and should!). Defender Advanced Security -> Firewall-Properties -> Logging -> Turn on for all profiles
7. Windows Search Database "C:\ProgramData\Microsoft\Search\Data\Applications\Windows"
8. IIS Logs
    * You can find the correct directory in the IIS management->Logging Menu
9. Connection errors, these sometimes are difficult to debug
    * ```ipconfig /all``` for current configuration(-mistakes)
    * ```ping``` for connectivity
    * ```nslookup <remote name>``` for name resolving
    * Firewall logs for blocked connections
    * Check/Change physical patch cable(s), these produce weird errors if broken
10. DNS Logs "C:\Windows\System32\dns"
    * Check this [Technet Guide](https://blogs.technet.microsoft.com/secadv/2018/01/22/parsing-dns-server-log-to-track-active-clients/)
11. DFSR, DHCP and other AD related logs "C:\Windows\debug\"
12. DHCP Logs "C:\Windows\System32\dhcp"
