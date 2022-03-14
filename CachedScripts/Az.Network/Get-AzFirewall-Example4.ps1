
$azFw=Get-AzFirewall -Name "azFw" -ResourceGroupName "rgName"

$appRule = New-AzFirewallApplicationRule -Name R1 -Protocol "http:80","https:443" -TargetFqdn "*google.com", "*microsoft.com" -SourceAddress "10.0.0.0"

$appRuleCollection = New-AzFirewallApplicationRuleCollection -Name "MyAppRuleCollection" -Priority 100 -Rule $appRule -ActionType "Allow"

$azFw.AddApplicationRuleCollection($appRuleCollection)
