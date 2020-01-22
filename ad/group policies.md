# Group Policies
Group policies are a neat way in a Active Directory to ensure all your enrolled devices and systems adhere to a defined minimum of security and other settings.

The default set of policies is sufficient for Windows native. If you use any non-Microsoft applications - as does basically everyone - and those adhere to specific registry entries, then it's possible to manage those applications aswell. Many bigger applications bring their own set of policies in a format called **.admx**.

## GPO Filtering
You can apply gpo by default to OUs, and have them be inherited downwards. With filters you can handle exceptions and grouping without creating new OUs. Since a machine can only reside within 1 OU, there is a limit to complexity if you only depend on OU structure and inheritance to apply your ruleset.

### Apply to (any) user dependant on the used machine
If you need to apply policies to any/all users using a specific machine dependant only on the machine, and different policies for other machines, you can do this with the loop back policy. 

The loop back policy is a entry within a gpo to enable. Every machine specific policy will then apply to the user. Either exclusively (replace) or additionally (merge). The policy is ``Computer Configuration\Administrative Templates\System\Group Policy\Loopback Policy``

## Install new Policies
* Download the new set of policies from the vendors resources. Be careful to not download malicious data; **only ever use official channels!**
* (most likely extract the files)
* decide which languages you want to use to manage your domain policies. This language does not matter to the client, it's only for administrative use.
* Copy the **.admx** files on any (not read-only) Domain Controller into _C:\Windows\Sysvol\<Domain>\Policies\PolicyDefinitions\_
* Copy each languages **.adml** all into their respective subfolders. Again, it would be enough to copy the *english files* to manage *italian clients and servers*.

## Do you need to update policies?
Microsoft releases new Policy definition at least with each Server Version. If you  update your domain with Domain Controllers of the new Server Version, you will automatically get those policies. Since it's sometimes difficult to update your Domain Controllers but your Clients already went to the next generation, it's also possible to manually add those new policies.

Download the new Policy Set and install them like any other Policy Set (see "Install new Policies")

## Will new (Microsoft) policies break my existing system?
Policies are always backwards compatible. In the end policies just offer a human readable option to set specific registry keys. If some policy is dropped, the registry key stays in the ruleset and just looses it's nice name.

Policies - by Microsoft atleast - are never changed. Hence it's always safe to update.

## Can I manage (the new) Edge with group policies?
Yes. The new Edge is based on chromium and handles group policies well. You can get the current set on their [Landing page](https://www.microsoft.com/en-us/edge/business/download)

## Which policies are currently active for my Edge instance?
Edge has a handy URL for this, open **edge://policy/**.

## Add uBlock Origin as a silently installed Extension
1. Find extension in the [store](https://microsoftedge.microsoft.com/addons/)
2. Get the extension ID (last part of the URL). uBlock Origin has **odfafepnkmbhccpbejgmiehpchacaeak**
3. Create a gpo in a fitting place for all machines who need to install this extension
4. Enable **Computer/Administrative Templates/Microsoft Edge/Extension/Control which extensions are installed silently"
5. Set Value: **cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx**

## Add custom filter entries for uBlock Origin
```
hive: HKEY_CURRENT_USER
path: Software\Policies\Microsoft\Edge\3rdparty\extensions\odfafepnkmbhccpbejgmiehpchacaeak\policy
type: REG_SZ

value: {"autoUpdate":true,"contextMenuEnabled":false,"showIconBadge":false},"netWhitelist":"about-scheme\nchrome-extension-scheme\nchrome-scheme\nmoz-extension-scheme\nopera-scheme\nvivaldi-scheme\nwyciwyg-scheme\n<URL1>\n<URL2>"}
```

## Can I manage Firefox with group policies?
Yes. Their GitHub repository contains the current set of policies, see [github.com/Mozilla](https://github.com/mozilla/policy-templates)

## Which policies are currently active for my Firefox instance?
Firefox has a handy URL for this, open **about:policies**. The "Documentation" Tab contains further explanations and examples for available policies.

## Can I manage Chrome with group policies?
Yes. Their Help Center contains the link to the current policies, see [Chrome Help Center](https://support.google.com/chrome/a/answer/187202?hl=en)

## Which policies are currently active for my Chrome instance?
Chrome has a handy URL for this, open **chrome://policy/**. Each Policy entry applies to either "Machine" or "Current user".

## To manage office addins, I need the ProgID of those. How do I get it?
Use PowerShell on a system with the addin installed
```powershell
# Excel
(New-Object -com Excel.Application).Comaddins
(New-Object -com Excel.Application).Addins
 
# Word
(New-Object -com Word.Application).Comaddins
(New-Object -com Word.Application).Addins
 
# Outlook
(New-Object -com Outlook.Application).Comaddins
(New-Object -com Outlook.Application).Addins
```
