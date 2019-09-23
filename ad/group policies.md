# Group Policies
Group policies are a neat way in a Active Directory to ensure all your enrolled devices and systems adhere to a defined minimum of security and other settings.

The default set of policies is sufficient for Windows native. If you use any non-Microsoft applications - as does basically everyone - and those adhere to specific registry entries, then it's possible to manage those applications aswell. Many bigger applications bring their own set of policies in a format called **.admx**.

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

## Can I manage Firefox with Group Policies?
Yes. Their GitHub repository contains the current set of policies [https://github.com/mozilla/policy-templates]
