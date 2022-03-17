
$RecordSet = Get-AzPrivateDnsRecordSet -Name "@" -RecordType SOA -Zone $Zone

$RecordSet.Records[0].Email = "admin.myzone.com"

Set-AzPrivateDnsRecordSet -RecordSet $RecordSet
