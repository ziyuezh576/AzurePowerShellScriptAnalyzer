
$containerObject = Get-AzStorageContainer -ResourceGroupName "myResourceGroup" -AccountName "myStorageAccount" -Name "myContainer"

Get-AzRmStorageContainerImmutabilityPolicy -Container $containerObject
