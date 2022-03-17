
$Records = @()

$Records += New-AzPrivateDnsRecordConfig -Value "This is a TXT Record"

$RecordSet = New-AzPrivateDnsRecordSet -Name "text" -RecordType TXT -ResourceGroupName "MyResourceGroup" -TTL 3600 -ZoneName "myzone.com" -PrivateDnsRecords $Records
