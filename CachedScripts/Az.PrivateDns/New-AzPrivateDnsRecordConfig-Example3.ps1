
$Records = @()

$Records += New-AzPrivateDnsRecordConfig -Cname www.contoso.com

$RecordSet = New-AzPrivateDnsRecordSet -Name "www" -RecordType CNAME -ResourceGroupName "MyResourceGroup" -TTL 3600 -ZoneName "myzone.com" -PrivateDnsRecords $Records
