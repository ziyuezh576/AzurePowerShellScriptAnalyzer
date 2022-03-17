
New-AzFrontDoorCdnRule -Action $action -Condition $condition -ProfileName $profileName -ResourceGroupName $resourceGroupName -RuleSetName $ruleSetName -RuleName $ruleName -Order $order
