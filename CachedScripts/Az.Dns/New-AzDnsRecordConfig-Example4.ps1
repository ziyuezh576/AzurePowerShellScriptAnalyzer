
$Records = @()

$Records += New-AzDnsRecordConfig -Exchange "mail.microsoft.com" -Preference 5

$RecordSet = New-AzDnsRecordSet -Name "www" -RecordType AAAA -ResourceGroupName "MyResourceGroup" -TTL 3600 -ZoneName "myzone.com" -DnsRecords $Records
