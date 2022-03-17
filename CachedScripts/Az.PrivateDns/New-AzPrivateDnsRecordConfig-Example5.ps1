
$Records = @()

$Records += New-AzPrivateDnsRecordConfig -Ptrdname www.contoso.com

$RecordSet = New-AzPrivateDnsRecordSet -Name "4" -RecordType PTR -ResourceGroupName "MyResourceGroup" -TTL 3600 -ZoneName "3.2.1.in-addr.arpa" -PrivateDnsRecords $Records
