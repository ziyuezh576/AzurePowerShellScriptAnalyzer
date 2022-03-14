
$dcr = Get-AzDataCollectionRule -ResourceGroupName "testdcr" -Name "newDcr"

$dcr.Description = 'This is a test'

$dcr | Set-AzDataCollectionRule
