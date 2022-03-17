
$PolicySetDefinition = Get-AzPolicySetDefinition -ResourceId '/subscriptions/mySub/Microsoft.Authorization/policySetDefinitions/myPSSetDefinition'

Remove-AzPolicySetDefinition -Id $PolicySetDefinition.ResourceId -Force
