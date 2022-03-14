
$nva=Get-AzNetworkVirtualAppliance -ResourceGroupName testrg -Name nva

Update-AzVirtualApplianceSite -Name testsite -ResourceGroupName testrg -AddresssPrefix 10.0.4.0/24 -NetworkVirtualApplianceId $nva.Id
