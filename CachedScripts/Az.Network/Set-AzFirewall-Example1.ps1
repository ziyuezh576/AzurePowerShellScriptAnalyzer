
$azFw = Get-AzFirewall -Name "AzureFirewall" -ResourceGroupName "rg"

$ruleCollection = $azFw.GetApplicationRuleCollectionByName("ruleCollectionName")

$ruleCollection.Priority = 101

Set-AzFirewall -AzureFirewall $azFw
