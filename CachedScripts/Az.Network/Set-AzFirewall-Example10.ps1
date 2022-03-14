
$azFw = Get-AzFirewall -Name "AzureFirewall" -ResourceGroupName "rg"

$ruleCollection = $azFw.GetNetworkRuleCollectionByName("ruleCollectionName")

$rule=$ruleCollection.GetRuleByName("ruleName")

$rule.DestinationAddresses = "10.10.10.10"

Set-AzFirewall -AzureFirewall $azFw
