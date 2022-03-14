
$nva = Get-AzNetworkVirtualAppliance -ResourceGroupName testrg -Name nva 

$o365Policy = New-AzOffice365PolicyProperty -Allow -Optimize

$site = New-AzVirtualApplianceSite -ResourceGroupName testrg -Name testsite -NetworkVirtualApplianceId $nva.Id -AddressPrefix 10.0.1.0/24 -O365Policy $o365Policy
