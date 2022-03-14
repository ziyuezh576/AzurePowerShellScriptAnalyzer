
$instancePool = Get-AzSqlInstancePool -ResourceGroupName "ResourceGroup01" -Name "instancePool0"

Get-AzSqlInstance -InstancePool $instancePool
