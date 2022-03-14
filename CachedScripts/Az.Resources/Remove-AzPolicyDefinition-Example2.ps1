
$PolicyDefinition = Get-AzPolicyDefinition -Name 'VMPolicyDefinition' 

Remove-AzPolicyDefinition -Id $PolicyDefinition.ResourceId -Force
