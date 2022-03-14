
$StartTime = Get-Date

$EndTime = $StartTime.AddHours(2.0)

New-AzStorageFileSASToken -ShareName "ContosoShare" -Path "FilePath" -Permission "rwd" -StartTime $StartTime -ExpiryTime $EndTime
