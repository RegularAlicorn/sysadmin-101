# Links
Common resources, useful information, places to learn and look-up documentations.

## Look-ups
* (https://icanhazip.com/)
  
  Your own IP with no other information sent in the content. Good for scripted IP checks
* (https://major.io/icanhazip-com-faq/)
  
  More plain Icanhazip, e.g. Ip, reverse DNS record, traceroute, epoch time and proxy check. All useful for scripted checks and clutter-free data
* (http://ifconfig.io/)
  
  Display Linux ifconfig similar output for your public interface
* (https://downdetector.com/)
  
  Quick overview of common sites with current issues
* (https://whois.domaintools.com/)
  
  Whois Lookup, useful to get (legitimate) owner information 
* (https://attack.mitre.org/)
  
  Huge amount of attack vector information. Use this to get to know your weak spots or places to start looking.
* (https://haveibeenpwned.com/Passwords)
  
  Check if your emails and passwords are in contained in public data leaks. Also get automatic notifications if accounts of your domain are within a new leak (you need to own the domain for this)
* (https://support.google.com/chrome/a/answer/187202?hl=en)
  
  Google Chrome GPO Templates
* (https://github.com/mozilla/policy-templates/releases)
  
  Mozilla Firefox GPO Templates
* (https://www.garykessler.net/library/file_sigs.html)
  
  GCK'S File Signatures Table

## Services
### Monitoring
* Create a Service Page with OpenSource - [Cachet](https://cachethq.io/ )
* (pulsetic.com)
* (pingdom.com)
* (statuscake.com)
* (uptime.com)
* (ohdear.app)

## Tools
* (https://www.virustotal.com/gui/home/upload)
  
  Check Files and URLs for malicious intend before opening them. This site uses multiple anti-malware software checks to get a result. There is an API to use automated tools.
* (https://decentsecurity.com/)
  
  Good security information, seems no longer maintained
* (http://correcthorsebatterystaple.net/)
  
  Generates passwords in the [XKCD style](http://xkcd.com/936/)
* (https://mxtoolbox.com/SuperTool.aspx)
  
  Check your MX records, DNS, blacklist lookup and SMTP diagnostics
* (https://www.shodan.io/)
  
  Search for IoT devices on public facing interfaces
* (https://termshark.io/)
  
  terminal UI for tshark to analyze pcap file and sniff live interface data
* (https://www.netresec.com/?page=Networkminer)
  
  Open Source network forensic analysis Tool
* (https://bgpstream.com/)
  
  BGP Monitor alerting hijacks, leaks and outages in the Border Gateway Protocol

## Guides
* (http://aka.ms/pskoans)
  
  Learn PowerShell with hands on question in the [kōan style](https://en.wikipedia.org/wiki/K%C5%8Dan)

* (https://phishingquiz.withgoogle.com/?hl=en)
  
  Google phishing quiz for users (and admins!). The self-evaluation expects self-reflection skills.

## Microsoft
Microsoft System related Links

### Security
* (http://aka.ms/privsec)
  
  Securing privileged access
* (https://aka.ms/PowerShellCorpus)
  
  OneDrive Link to a PowerShell tool for detecting obfuscated PowerShell commands and scripts at scale. Check out their [GitHub Rep](https://github.com/danielbohannon/Revoke-Obfuscation)
* (http://aka.ms/LAPS)

  LAPS solution download
* (http://aka.ms/JEA)
  
  Just Enough Administration, PowerShell security technology system
* (https://aka.ms/WEF)
  
  Massive information collection for Windows event Forwarding. Consider implementing this!
* (https://support.microsoft.com/en-us/help/832017/service-overview-and-network-port-requirements-for-windows)
  
  Massive amount of information of Windows service and network port requirements

### Active Directory
**AD Guides**
* (https://gallery.technet.microsoft.com/Step-by-Step-Deploy-Local-7c9ef772)
  
  Step by Step deploy Microsoft LAPS solution
* (https://blogs.technet.microsoft.com/nepapfe/2013/03/01/its-simple-time-configuration-in-active-directory/)
  
  Short and simple explanation of WHY and HOW for Time Configuration in Active Directory
* (https://www.dtonias.com/backup-restore-dhcp-server-2016/)

  Backup and Restore DHCP Server 2016
* (https://docs.microsoft.com/en-us/windows/deployment/volume-activation/activate-using-active-directory-based-activation-client)
  
  Activate using Active Directory-based activation
* (https://techcommunity.microsoft.com/t5/Azure-Active-Directory-Identity/Azure-AD-Password-Protection-is-now-generally-available/ba-p/377487)
  
  Azure Password protection to enforce better user passwords
* (https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee126102(v%3dws.10))
  
  Active Directory Certificate Services Migration

**AD Look-up**
* (https://support.microsoft.com/en-us/help/243330/well-known-security-identifiers-in-windows-operating-systems)

  Well-known security identifiers list

**AD Tools**
* (http://www.cjwdev.com/Software.html?LMCL=PbAXdB)

  (Older) AD management software collection, useful in specific cases
  
**AD Templates**
* (https://www.microsoft.com/en-us/download/100591)

  Administrative Templates (.admx) for Windows 10 November 2019 Update (1909)
  
#### AD Security
* (http://aka.ms/HardenAD)
  
  Reducing the Active Directory Attack Surface
* (http://aka.ms/tiermodel)
  
  Active Directory administrative tier model for improved administrative protection
* (http://aka.ms/CyberPAW)

  Massive Privileged Access Workstations information. For most systems, just take ideas from this
* [Security Baseline Win10 1909/Server1909](https://techcommunity.microsoft.com/t5/Microsoft-Security-Baselines/Security-baseline-FINAL-for-Windows-10-v1909-and-Windows-Server/ba-p/1023093)
* [Security Baseline Win10 1903/Server 1903](https://blogs.technet.microsoft.com/secguide/2019/05/23/security-baseline-final-for-windows-10-v1903-and-windows-server-v1903/)
* [Security Baseline Office 2016/Office 365 ProPlus apps](https://blogs.technet.microsoft.com/secguide/2018/02/13/security-baseline-for-office-2016-and-office-365-proplus-apps-final/)

* [Security Baseline Win10 1809/Server 2019](https://blogs.technet.microsoft.com/secguide/2018/11/20/security-baseline-final-for-windows-10-v1809-and-windows-server-2019/)
