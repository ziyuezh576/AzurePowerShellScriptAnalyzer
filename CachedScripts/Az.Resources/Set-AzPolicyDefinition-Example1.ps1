
$PolicyDefinition = Get-AzPolicyDefinition -Name 'VMPolicyDefinition'

Set-AzPolicyDefinition -Id $PolicyDefinition.ResourceId -Description 'Updated policy to not allow virtual machine creation'
