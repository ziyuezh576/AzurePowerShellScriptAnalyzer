
$Records = @()

$Records += New-AzPrivateDnsRecordConfig -Exchange "mail.microsoft.com" -Preference 5

$RecordSet = New-AzPrivateDnsRecordSet -Name "www" -RecordType MX -ResourceGroupName "MyResourceGroup" -TTL 3600 -ZoneName "myzone.com" -PrivateDnsRecords $Records
