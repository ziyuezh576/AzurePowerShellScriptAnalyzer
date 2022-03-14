
$azFw=Get-AzFirewall -Name "azFw" -ResourceGroupName "rgName"

$azFw.RemoveApplicationRuleCollectionByName("MyAppRuleCollection")
