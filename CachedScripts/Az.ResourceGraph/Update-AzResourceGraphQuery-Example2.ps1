
$query =  Get-AzResourceGraphQuery -ResourceGroupName azure-rg-test -Name query-t05 

Update-AzResourceGraphQuery -InputObject $query -File './Query.kql'
