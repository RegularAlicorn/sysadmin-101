$updates = Get-CimInstance Win32_QuickFixEngineering |
     Select-Object HotFixID, Description, InstalledOn |
     Sort-Object InstalledOn

 $updates | Format-Table -AutoSize
