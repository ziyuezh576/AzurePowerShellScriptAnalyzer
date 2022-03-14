
$RecordSet = Get-AzDnsRecordSet -ResourceGroupName MyResourceGroup -ZoneName myzone.com -Name www -RecordType A

Add-AzDnsRecordConfig -RecordSet $RecordSet -Ipv4Address 172.16.0.0

Add-AzDnsRecordConfig -RecordSet $RecordSet -Ipv4Address 172.31.255.255

Set-AzDnsRecordSet -RecordSet $RecordSet

Get-AzDnsRecordSet -ResourceGroupName MyResourceGroup -ZoneName myzone.com -Name www -RecordType A | Add-AzDnsRecordConfig -Ipv4Address 172.16.0.0 | Add-AzDnsRecordConfig -Ipv4Address 172.31.255.255 | Set-AzDnsRecordSet
