
$Context01 = New-AzStorageContext -Local 

$Context02 = New-AzStorageContext -StorageAccountName "ContosoGeneral" -StorageAccountKey "< Storage Key for ContosoGeneral ends with == >"

($Context01, $Context02) | Get-AzStorageContainer
