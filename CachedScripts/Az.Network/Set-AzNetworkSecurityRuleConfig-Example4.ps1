
$nsg = Get-AzNetworkSecurityGroup -ResourceGroupName "MyResource" -Name "MyNsg"

($nsg.SecurityRules | Where-Object {$_.Name -eq "RuleName"}).SourceAddressPrefix = ([System.String[]] @("xxx.xxx.xxx.xxx"))

$nsg | Set-AzNetworkSecurityGroup | Get-AzNetworkSecurityRuleConfig -Name "RuleName"
