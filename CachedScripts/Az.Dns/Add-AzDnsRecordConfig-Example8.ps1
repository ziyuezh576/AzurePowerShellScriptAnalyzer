
$RecordSet = Get-AzDnsRecordSet -Name text -RecordType TXT -ResouceGroupName MyResourceGroup -ZoneName myzone.com

Add-AzDnsRecordConfig -RecordSet $RecordSet -Value "This is a TXT Record"

Set-AzDnsRecordSet -RecordSet $RecordSet

Get-AzDnsRecordSet -Name text -RecordType TXT -ResouceGroupName MyResourceGroup -ZoneName myzone.com | Add-AzDnsRecordConfig -Value "This is a TXT Record" | Set-AzDnsRecordSet
