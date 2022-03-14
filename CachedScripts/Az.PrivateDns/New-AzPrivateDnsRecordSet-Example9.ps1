
$Records = @()

$Records += New-AzPrivateDnsRecordConfig -Ipv4Address 1.2.3.4

$RecordSet = New-AzPrivateDnsRecordSet -Name "*" -RecordType A -ResourceGroupName "MyResourceGroup" -TTL 3600 -ZoneName "myzone.com" -PrivateDnsRecords $Records
