
$ResourceGroup = Get-AzResourceGroup -Name 'ResourceGroup11'

$Policy = Get-AzPolicyDefinition -Name 'VirtualMachinePolicy'

$UserAssignedIdentity = Get-AzUserAssignedIdentity -ResourceGroupName 'ResourceGroup1' -Name 'UserAssignedIdentity1'

New-AzPolicyAssignment -Name 'VirtualMachinePolicyAssignment' -PolicyDefinition $Policy -Scope $ResourceGroup.ResourceId -Location 'eastus' -IdentityType 'UserAssigned' -IdentityId $UserAssignedIdentity.Id
