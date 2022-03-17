
$SasToken = New-AzStorageContainerSASToken -Name "ContosoMain" -Permission "rad"

$Context = New-AzStorageContext -StorageAccountName "ContosoGeneral" -SasToken $SasToken

$Context | Get-AzStorageBlob -Container "ContosoMain"
