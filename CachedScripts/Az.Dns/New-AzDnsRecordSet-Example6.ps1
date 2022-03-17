
$Records = @()

$Records += New-AzDnsRecordConfig -Ptrdname www.contoso.com

$RecordSet = New-AzDnsRecordSet -Name "4" -RecordType PTR -ResourceGroupName "MyResourceGroup" -TTL 3600 -ZoneName "3.2.1.in-addr.arpa" -DnsRecords $Records
