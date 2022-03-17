
$ctx = New-AzStorageContext -StorageAccountName $accountName -UseConnectedAccount

$StartTime = Get-Date

$EndTime = $startTime.AddDays(6)

New-AzStorageContainerSASToken -Name "ContainerName" -Permission rwd -StartTime $StartTime -ExpiryTime $EndTime -context $ctx
