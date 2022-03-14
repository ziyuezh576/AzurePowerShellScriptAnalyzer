
$dcr = Get-AzDataCollectionRule -ResourceGroupName "testdcr" -Name "newDcr"

$dcr | Update-AzDataCollectionRule -Tag @{"tag1"="value1"; "tag2"="value2"}
