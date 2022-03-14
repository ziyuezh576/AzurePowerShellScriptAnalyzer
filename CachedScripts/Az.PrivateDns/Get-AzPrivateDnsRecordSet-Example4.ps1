
$Zone = Get-AzPrivateDnsZone -Name "myzone.com" -ResourceGroupName "MyResourceGroup"

$RecordSets = Get-AzPrivateDnsRecordSet -Zone $Zone
