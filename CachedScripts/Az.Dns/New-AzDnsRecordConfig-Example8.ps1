
$Records = @()

$Records += New-AzDnsRecordConfig -Value "This is a TXT Record"

$RecordSet = New-AzDnsRecordSet -Name "text" -RecordType TXT -ResourceGroupName "MyResourceGroup" -TTL 3600 -ZoneName "myzone.com" -DnsRecords $Records
