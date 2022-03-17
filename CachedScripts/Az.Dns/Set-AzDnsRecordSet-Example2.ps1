
$RecordSet = Get-AzDnsRecordSet -Name "@" -RecordType SOA -Zone $Zone

$RecordSet.Records[0].Email = "admin.myzone.com"

Set-AzDnsRecordSet -RecordSet $RecordSet
