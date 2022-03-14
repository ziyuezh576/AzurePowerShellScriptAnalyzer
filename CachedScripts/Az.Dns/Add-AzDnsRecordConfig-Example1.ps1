
$RecordSet = Get-AzDnsRecordSet -Name www -RecordType A -ResouceGroupName MyResourceGroup -ZoneName myzone.com

Add-AzDnsRecordConfig -RecordSet $RecordSet -Ipv4Address 1.2.3.4

Set-AzDnsRecordSet -RecordSet $RecordSet

Get-AzDnsRecordSet -Name www -RecordType A -ResouceGroupName MyResourceGroup -ZoneName myzone.com | Add-AzDnsRecordConfig -Ipv4Address 1.2.3.4 | Set-AzDnsRecordSet
