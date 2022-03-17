
$Records = @()

$Records += New-AzDnsRecordConfig -Nsdname ns1-01.azure-dns.com

$RecordSet = New-AzDnsRecordSet -Name "ns1" -RecordType NS -ResourceGroupName "MyResourceGroup" -TTL 3600 -ZoneName "myzone.com" -DnsRecords $Records
