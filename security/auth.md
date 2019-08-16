# Auth
There is a lot of things to consider, configure, and monitor to increase the safety of your system. Some of these we will look at here.

## NTLM
NTLM, the Windows Version of Challenge/Response authentication, was the default protocol up to Windows NT 4.0 (NTLMv2 to be precise, the improved version). Due to legacy systems in the corporate world Microsoft has to keep this around. Starting with Wndows 2000 they switched to Kerberos for the default authentication protocol. 
As sysadmins on the other hand we only need it if we have one of these very specific systems.

### How do I find Systems authenticating with NTLM?
Assessing NTLM usage within a domain - or forest - is no easy task and can take quite some time. We only look at certain single point actions to perform and ignore the planning phase. This does not implicate the planning phase might be less important, in reality it takes up more time and is difficult to execute.
NTLM authentication is between two parties with a third party as a trust - in this case most likely a Domain Controller. If a server has NTLM authentication coming in, and you restart it, you'll receive a __System__ event with ID **6038** telling you about NTLM-Authentication. You can use this as a hint to start investigating.
1. In the __Security__ event log, search for ID **4624**. The **AuthenticationPackageName** will tell you about the authentication provider. You'll get __Kerberos__, __Negotiate__, and __NTLM__. Within a NTLM authentication event note down the **TargetUserName**, **TargetDomainName**, and **WorkstationName** to track down the culprit.
Additional event IDs are **540** (2k3, XP), **8001, 8002, 8003, 8004**, **6038** 
2. If a system makes an authentication attempt with Kerberos but produces a SNP failure there might happen a protocol degredation to NTLM. Check for events **673** (2k3, XP), and **4772**.

### What are typial reasons for systems use of NTLM?
1. They do not support Kerberos - which is rather unlikely
2. They support Kerberos but are configured to use NTLM
3. They have no proper SPN (service principal name) - this is required for Kerberos
4. They use their IP for communication instead of DNS
