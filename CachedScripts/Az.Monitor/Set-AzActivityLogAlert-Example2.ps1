
$location = 'Global'

$alertName = 'myAlert'

$resourceGroupName = 'theResourceGroupName'

$condition1 = New-AzActivityLogAlertCondition -Field 'field1' -Equal 'equals1'

$condition2 = New-AzActivityLogAlertCondition -Field 'field2' -Equal 'equals2'

$dict = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"

$dict.Add('key1', 'value1')

$actionGrp1 = New-AzActionGroup -ActionGroupId 'actiongr1' -WebhookProperty $dict

Set-AzActivityLogAlert -Location $location -Name $alertName -ResourceGroupName $resourceGroupName -Scope 'scope1','scope2' -Action $actionGrp1 -Condition $condition1, $condition2 -DisableAlert
