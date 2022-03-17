
$Records = @()

$Records += New-AzDnsRecordConfig -Cname www.contoso.com

$RecordSet = New-AzDnsRecordSet -Name "www" -RecordType CNAME -ResourceGroupName "MyResourceGroup" -TTL 3600 -ZoneName "myzone.com" -DnsRecords $Records
