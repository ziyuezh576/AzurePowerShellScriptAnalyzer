
$azFw=Get-AzFirewall -Name "azFw" -ResourceGroupName "rgName"

$azFw.RemoveNetworkRuleCollectionByName("MyNetworkRuleCollection")
