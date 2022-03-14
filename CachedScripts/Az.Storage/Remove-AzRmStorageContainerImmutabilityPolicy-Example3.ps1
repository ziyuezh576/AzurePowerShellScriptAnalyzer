
$containerObject = Get-AzStorageContainer -ResourceGroupName "myResourceGroup" -AccountName "myStorageAccount" -Name "myContainer"

$policy = Get-AzRmStorageContainerImmutabilityPolicy -Container $containerObject

Remove-AzRmStorageContainerImmutabilityPolicy -Container $containerObject -Etag $policy.Etag
