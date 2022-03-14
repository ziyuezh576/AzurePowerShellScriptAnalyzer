
$RecordSet = Get-AzDnsRecordSet -Name "www" -RecordType A -ResouceGroupName "MyResourceGroup" -ZoneName "myzone.com"

Remove-AzDnsRecordConfig -RecordSet $RecordSet -Ipv4Address 1.2.3.4

Set-AzDnsRecordSet -RecordSet $RecordSet

Get-AzDnsRecordSet -Name "www" -RecordType A -ResouceGroupName "MyResourceGroup" -ZoneName "myzone.com" | Remove-AzDnsRecordConfig -Ipv4Address 1.2.3.4 | Set-AzDnsRecordSet
