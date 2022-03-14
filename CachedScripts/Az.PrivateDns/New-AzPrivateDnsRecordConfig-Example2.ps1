
$Records = @()

$Records += New-AzPrivateDnsRecordConfig -Ipv6Address 2001:db8::1

$RecordSet = New-AzPrivateDnsRecordSet -Name "www" -RecordType AAAA -ResourceGroupName "MyResourceGroup" -TTL 3600 -ZoneName "myzone.com" -PrivateDnsRecords $Records
