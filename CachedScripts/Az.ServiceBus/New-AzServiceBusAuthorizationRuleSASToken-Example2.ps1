
$StartTime = Get-Date

$EndTime = $StartTime.AddHours(2.0)

$SasToken = New-AzServiceBusAuthorizationRuleSASToken -AuthorizationRuleId $updatedAuthRule.Id  -KeyType Primary -ExpiryTime $EndTime
