
$query = Get-AzResourceGraphQuery -ResourceGroupName azure-rg-test -Name query-t02

Remove-AzResourceGraphQuery -InputObject $query
