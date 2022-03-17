
$RecordSet = Get-AzDnsRecordSet -Name abc -RecordType NS -ResouceGroupName MyResourceGroup -ZoneName myzone.com

Add-AzDnsRecordConfig -Nsdname ns1.myzone.com -RecordSet $RecordSet

Set-AzDnsRecordSet -RecordSet $RecordSet

Get-AzDnsRecordSet -Name abc -RecordType NS -ResouceGroupName MyResourceGroup -ZoneName myzone.com | Add-AzDnsRecordConfig -Nsdname ns1.myzone.com | Set-AzDnsRecordSet
