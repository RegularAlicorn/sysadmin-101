# Powershell Cheatsheet

## Manual
**Find installed modules** `Get-InstalledModule`{.powershell}

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

## Development Environment
**Install a new module** `Install-Module -Name <ModuleName>`

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

ForEach only took 82.2% of the pipeline time, which is a lot! While this test is not exactly scientific it still shows the relevant information to make a better informed choice on the next script.

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
