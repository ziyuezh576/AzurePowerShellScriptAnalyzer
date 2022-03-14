
$TimeWindowSize = New-TimeSpan -Minutes 5

$TimeWindowRule = New-AzDeviceSecurityGroupTimeWindowRuleObject -Type "ActiveConnectionsNotInAllowedRange" -Enabled $true 

Set-AzDeviceSecurityGroup -Name "MySecurityGroup" 
