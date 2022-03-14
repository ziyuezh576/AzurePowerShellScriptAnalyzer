
$ResourceGroup = Get-AzResourceGroup -Name 'ResourceGroup11'

$Policy = Get-AzPolicyDefinition -Name 'VirtualMachinePolicy'

New-AzPolicyAssignment -Name 'VirtualMachinePolicyAssignment' -PolicyDefinition $Policy -Scope $ResourceGroup.ResourceId
