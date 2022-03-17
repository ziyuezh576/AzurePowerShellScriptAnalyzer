
$RecordSet = Get-AzDnsRecordSet -Name "www" -ResourceGroupName "MyResourceGroup" -ZoneName "myzone.com"

Remove-AzDnsRecordSet -RecordSet $RecordSet
