
$azFw=Get-AzFirewall -Name "azFw" -ResourceGroupName "rgName"

$getNetRc=$azFw.GetNetworkRuleCollectionByName("MyNetworkRuleCollection")
