
$Records = @()

$Records += New-AzDnsRecordConfig -Ipv4Address 1.2.3.4

$RecordSet = New-AzDnsRecordSet -Name "*" -RecordType A -ResourceGroupName "MyResourceGroup" -TTL 3600 -ZoneName "myzone.com" -DnsRecords $Records
