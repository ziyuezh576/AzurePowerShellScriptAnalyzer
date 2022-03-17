
$azFw=Get-AzFirewall -Name "azFw" -ResourceGroupName "rgName"

$getAppRc=$azFw.GetApplicationRuleCollectionByName("MyAppRuleCollection")
