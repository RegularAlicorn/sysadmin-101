# Microsoft Deployment Tools
MDT is a useful tool to deploy systems - virtual and physical - with custom settings and fully updated without a golden image. Settings are seperated by new lines, contain no quotation marks and use "=" to seperate name and value.

## Parameter bootstrap.ini
The bootstrap.ini is executed during the first PE boot and located in X:\DeploymentShare\Control\Bootstrap.ini.

### Settings table
Setting | Description
--------|------------
Priority | Takes a comma seperated list of jump-to blocks to execute. Default list only contains "Default". Each Block is enclosed in [Brackets]. E.g. **Priority=Brackets,Default**
DeployRoot | Contains the path to the deployment share. E.g. **DeployRoot=\\mdt-deploy\DeploymentShare$**
SkipBDDWelcome=YES | Skips the initial welcome screen. This screen lets you choose your keyboard locale - only for pre-installation settings - and specifcy a static IP if needed.
KeyboardLocalePE | See [Microsoft Docs](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/default-input-locales-for-windows-language-packs) for the appropriate identifier, use only the numbers. E.g. **KeyboardLocalePE=0409:00000409**
UserID | Username for network access to the _DeploymentShare$_, only _Read_ permissions needed. E.g. **UserID=MDT_BA**
UserPassword | Userpassword for network access to the _DeploymentShare$, only _Read_ permissions needed. **This password is saved in clear text on the deployment image!** Keep this user as low on permissions as you possibly can! E.g. **UserPassword=P@ssword!**
UserDomain | Domain for network access user to the _DeploymentShare$_

### A simple bootstrap.ini
```shell
[Settings]
Priority=Default

[Default]
DeployRoot=\\DEPLOY.EXAMPLE.LOCAL\DeploymentShare$
SkipBDDWelcome=YES
KeyboardLocalePE=0409:00000409
UserID=MDT_BA
UserPassword=P@ssword!
UserDomain=EXAMPLE
```

## Parameter customSettings.ini
The customSettings.ini is executed after the bootstrap.ini and located in X:\DeploymentShare\Control\customSettings.ini

### Settings table
Setting | Description
--------|------------
Priority | Takes a comma seperated list of jump-to blocks to execute. Default list only contains "Default". Each Block is enclosed in [Brackets]. E.g. **Priority=Brackets,Default**

### Step configuration / skipping
#### Local Admin Password
SkipAdminPassword=YES | Skip local admin password step


### A simple customSettings.ini

## Test customSettings.ini
Create a batch file in _%deploymentroot%/scripts/testIni.bat_
```shell
del C:\MININT\SMSOSD\OSDLOGS\VARIABLES.DAT /q
cscript ZTIGather.wsf /inifile:..\Control\CustomSettings.ini
"C:\Program Files (x86)\ConfigMgr 2007 Toolkit V2\Trace32.exe" c:\minint\smsosd\osdlogs\bdd.log
```
