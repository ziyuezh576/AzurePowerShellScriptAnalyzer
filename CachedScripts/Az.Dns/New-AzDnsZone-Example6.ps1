
$PZone = New-AzDnsZone -Name "zone.com" -ResourceGroupName "MyResourceGroup" 

$Zone = New-AzDnsZone -Name "mychild.zone.com" -ResourceGroupName "MyResourceGroup" -ParentZone @($PZone)
