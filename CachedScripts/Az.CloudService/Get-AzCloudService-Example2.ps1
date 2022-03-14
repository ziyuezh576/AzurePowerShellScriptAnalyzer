
Get-AzCloudService -ResourceGroupName "ContosOrg" -CloudServiceName "ContosoCS"

$cloudService = Get-AzCloudService -ResourceGroupName "ContosOrg" -CloudServiceName "ContosoCS"

$cloudService | Format-List
