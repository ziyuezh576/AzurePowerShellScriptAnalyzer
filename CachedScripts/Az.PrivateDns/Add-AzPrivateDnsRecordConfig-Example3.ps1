
$RecordSet = Get-AzPrivateDnsRecordSet -Name www -RecordType CNAME -ResourceGroupName MyResourceGroup -ZoneName myzone.com

Add-AzPrivateDnsRecordConfig -RecordSet $RecordSet -Cname contoso.com

Set-AzPrivateDnsRecordSet -RecordSet $RecordSet

Get-AzPrivateDnsRecordSet -Name www -RecordType CNAME -ResourceGroupName MyResourceGroup -ZoneName myzone.com | Add-AzPrivateDnsRecordConfig -Cname contoso.com | Set-AzPrivateDnsRecordSet
