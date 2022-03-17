
$Zone = Get-AzDnsZone -Name "myzone.com" -ResourceGroupName "MyResourceGroup"

$Zone.Tags = @(@{"Name"="Dept"; "Value"="Electrical"})

Set-AzDnsZone -Zone $Zone
