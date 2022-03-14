
$ResourceGroup = Get-AzResourceGroup -Name 'ResourceGroup11'

$Assignment = Get-AzPolicyAssignment -Name 'VirtualMachinePolicyAssignment'

New-AzPolicyExemption -Name 'VirtualMachinePolicyAssignment' -PolicyAssignment $Assignment -Scope $ResourceGroup.ResourceId -ExemptionCategory Mitigated
