
$RecordSet = Get-AzPrivateDnsRecordSet -Name "www" -ResourceGroupName "MyResourceGroup" -ZoneName "myzone.com"

Remove-AzPrivateDnsRecordSet -RecordSet $RecordSet
