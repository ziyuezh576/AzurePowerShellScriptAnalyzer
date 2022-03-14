
New-AzApplicationGatewayFirewallPolicy -CustomRule <PSApplicationGatewayFirewallCustomRule[]> -Location 'westus' -Name wafResource1 -PolicySetting <PSApplicationGatewayFirewallPolicySettings> -ResourceGroupName 'rg1'
