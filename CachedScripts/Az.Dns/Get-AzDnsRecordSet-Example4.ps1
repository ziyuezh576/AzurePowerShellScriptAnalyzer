
$Zone = Get-AzDnsZone -Name "myzone.com" -ResourceGroupName "MyResourceGroup"

$RecordSets = Get-AzDnsRecordSet -Zone $Zone
