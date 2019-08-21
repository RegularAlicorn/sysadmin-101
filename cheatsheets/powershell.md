# Powershell Cheatsheet

## Manual
**Find installed modules** `Get-InstalledModule`

**Find command by name** `Get-Command "*<PartialName>*"`

**All commands of a module** `Get-Command -FullyQualifiedModule <ModuleName>`

**Help for a commmand** `Get-Help <CommandName>`

## Development Environment
**Install a new module** `Install-Module -Name <ModuleName>`

## Looping
Given a dataset _$data_ of values

**Powershell Pipeline**
```powershell
# Pipeline into ForEach block
# $_ is a magic variable containing the current cycle item
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
