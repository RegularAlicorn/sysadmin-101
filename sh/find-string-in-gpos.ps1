Import-Module GroupPolicy

# The string you want to find
$string = "abcd"

# Domain to search
$DomainName = $env:USERDNSDOMAIN

Write-Host "Finding all GPOs in $DomainName..."
$allGpos = Get-GPO -All -Domain $DomainName

Write-Host "Starting search..."
$counter = 1

foreach ($gpo in $allGpos) {
    $report = Get-GPOReport -Guid $gpo.Id -ReportType Xml

    if ($report -match $string) {
        Write-Host "***** Match found in: $($gpo.DisplayName) *****" -ForegroundColor Green
    } else {
        Write-Host "$counter. No match in: $($gpo.DisplayName)"
    }

    $counter++
}
