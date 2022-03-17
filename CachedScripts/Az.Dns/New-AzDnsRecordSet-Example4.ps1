
$Records = @()

$Records += New-AzDnsRecordConfig -Exchange "mail.microsoft.com" -Preference 5

$RecordSet = New-AzDnsRecordSet -Name "mail" -RecordType MX -ResourceGroupName "MyResourceGroup" -TTL 3600 -ZoneName "myzone.com" -DnsRecords $Records
