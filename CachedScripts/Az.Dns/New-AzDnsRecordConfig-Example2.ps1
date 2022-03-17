
$Records = @()

$Records += New-AzDnsRecordConfig -Ipv6Address 2001:db8::1

$RecordSet = New-AzDnsRecordSet -Name "www" -RecordType AAAA -ResourceGroupName "MyResourceGroup" -TTL 3600 -ZoneName "myzone.com" -DnsRecords $Records
