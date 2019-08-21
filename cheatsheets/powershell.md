# Powershell Cheatsheet

## Manual
**Find installed modules** `Get-InstalledModule`

**Find command by name** `Get-Command "*<PartialName>*"`

**All commands of a module** `Get-Command -FullyQualifiedModule <ModuleName>`

**Help for a commmand** `Get-Help <CommandName>`

## Windows Environment
Window environment variables can be accessed through a Powershell Drive _env:_. You can jump into this drive like in any other drive with `cd env:` and display its contents with `ls` or `dir`.

### Get
**List all variables** `Get-ChildItem env:`
**Value of path variable** `Get-ChildItem env:Path` _OR_ `$env:Path`
**Temp locaion** `Get-ChildItem env:TEMP` _OR_ `$env:TEMP`
**COmputername** `Get-ChildItem env:COMPUTERNAME` _OR_ `$env:COMPUTERNAME`
**Username** `Get-ChildItem env:USERNAME` _OR_ `$env:USERNAME`
**Userdomain** `Get-ChildItem env:USERDOMAIN` _OR_ `$env:USERDOMAIN`

#### Examples
* Walk all Path entries and find java (which has its own `$env:` entry!)
```powershell
$env:Path -split ';' | ? {$_ -like '*java*'}
```

* Find all locations powershell **automatically** loads modules from
```powershell
$env:PSModulePath -split ';'
```

### Set
You can change the values of environment variables similar to `set` of the command terminal. Changes will only affect the current sessions and not persist reboots. For a permanent change you will need to make those changes within the registry.

#### Examples (non-persistent)
**Add C:\scripts\ to the current _PATH_** `$env:Path += 'C:\scripts'`
**Remove variable _"scripts"_** `$env:scripts = ''` _OR_ `$env:scripts = $null`

## Powershell drives
PSDrives are a the way of powershell to handle different working directories. This does not only include the intuitive filesystem drives but also the registry, ws management, windows environment variables, and active directory.

You can see all available drives with the following command and change location into them with `cd <Name>:` or `Set-Location <Name>:`
```powershell
# Display all drives
Get-PSDrive
# Change location to Alias
Set-Location Alias:
# Display all alias-commands in current session
Get-ChildItem

# Find alias translation for ?
Get-ChildItem | Where-Object {$_.Name -eq '%'}
# Hence we can use
Get-ChildItem | ? {$_.Name -eq 'ls'}
# And
ls | ? {$_.Name -eq 'ogv'}

# Switch to Active Directory drive
Set-Location AD:
# Display contents
ls
# Switch to domain
Set-Location "dc=example,dc=com"
# Switch to container "users" and display all users
# Always use the most significant part of the distinguishedName to traverse
cd CN=Users
ls

# Switch to Registry current user/Software/Chrome
Set-Location HKCU:/Software/Chrome
# Read Item "chrome"
Get-Item chrome
Get-ItemProperty chrome
```
## Development Environment
**Install a new module** `Install-Module -Name <ModuleName>`

## Active Directory Module
**Basics**
```powershell
# Import Powershell AD Module
Import-Module ActiveDirectory

# Forest object
Get-ADForest example.com

# Domain object
Get-ADDomain sub.example.com

# Check current domain/forest functional level
(Get-ADDomain sub.example.com).DomainMode
(Get-ADForest example.com).ForestMode

# Raise domain functional level, this requires ALL domain controller to be atleast at that version
Set-ADDomainMode -Identity sub.example.com -DomainMode Windows2012R2Domain

# Raise forest functional level, this requires ALL DOMAINS to be atleast at that version
Set-ADForestMode -Identity example.com -ForestMode Windows2012R2Forest

# Find current FSMO role holders
netdom /query FSMO

# Move FSMO roles, only FORCE if you are sure to NEVER use the old role holder EVER AGAIN. EVER!
Move-ADDirectoryServerOperationMasterRole -Identity "DC01" `
    -OperationMasterRole DomainNamingMaster,InfrastructureMaster,PDCEmulator,RIDMaster,SchemaMaster

# Get user object
Get-ADUser -Identity "Mr Fantastic"

# Get group object
Get-ADGroup -Identity "Fantastic4"

# Get computer object
Get-ADComputer -Filter 'Name -like "server*"'

# Filtered search with additional properties
Get-ADUser -Filter 'Name -like "Mr*"' -SearchBase "CN=users,DC=example,DC=com" -Properties Description

# Get group members
Get-ADGroupMember -Identity "Fantastic4" -Recursive

# Deactivate some account
Disable-ADAccount -Identity MrFantastic

# Enable some account
Enable-ADAccount -Identity MrFantastic

# Unlock a locked account
Unlock-ADAccount -Identity MrFantastic

# Get default domain password policy
Get-ADDefaultDomainPasswordPolicy -Identity example.com

# Get all fine-grained password policies, filter for just "*" is enough
Get-ADFineGrainedPasswordPolicy -Filter {name -like "*"}

# Get to which subjects a fine-grained password policy has been applied to
Get-ADFineGrainedPasswordPolicySubject -Identity 'Super 4 Secure'

# Add a group to an existing fine-grained password policy
Add-ADFineGrainedPasswordPolicySubject 'Super 4 Secure' -Subjects "Fantastic4"
```
**Recycle bin feature** _(Requires forest fuctional level of at least 2008R2)_
```powershell
# Enable recycle bin feature
Enable-ADOptionalFeature 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target 'example.com'

# Get all deleted objects not named like "test"
Get-ADObject -Filter {IsDeleted -eq $True -and Name -notlike "test*"} -IncludeDeletedObjects

# Restore some deleted user object
Get-ADObject -Filter 'samaccountname -eq "MrFantastic"' -IncludeDeletedObjects | Restore-ADObject
```
## Looping
Given a dataset _$data_ of values

**Powershell Pipeline**
```powershell
# Pipeline into ForEach block
# $_ is an automatically created variable containing the current loop object 
$data | % {$_}

# Same as
$data | ForEach-Object {$_}

# Pipe into any other function accepting pipline input
# If $data is a list of Active Directory identities, output ad data of users into a file
$data | Get-ADUser | Out-File "C:\temp\ad-users.txt"
```

**Powershell ForEach**
```powershell
$data.ForEach({ $_ })
```

**Speed difference**

ForEach is faster for processing lots of iterative data cycles. The pipeline - while useful for one-liners - is slower. A quick run of some math operations gave me the following results:

Pipeline: _5098 milliseconds_

ForEach:  _4193 milliseconds_

ForEach only took **82.2%** of the pipeline time, which is a lot! While this test is not exactly scientific it still shows the relevant information to make a better informed choice on the next script.

I used the following code for a quick test:
```powershell
$data = @()
for($i = 0;$i -lt 100000;$i++) {
    $data += @{'i'=$i*3}
}

$sw = [System.Diagnostics.Stopwatch]::StartNew()
$data | %{
    [Math]::Atan([Math]::sin([Math]::Acos($i)) + [Math]::Tan($i)) | Out-Null
}
$sw.Stop()
$sw

$sw = [System.Diagnostics.Stopwatch]::StartNew()
$data.forEach({
    [Math]::Atan([Math]::sin([Math]::Acos($i)) + [Math]::Tan($i)) | Out-Null
})
$sw.Stop()
$sw
```
