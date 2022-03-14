
$ResourceGroup = Get-AzResourceGroup -Name 'ResourceGroup11'

$PolicyAssignment = Get-AzPolicyAssignment -Name 'PolicyAssignment' -Scope $ResourceGroup.ResourceId

Set-AzPolicyAssignment -Id $PolicyAssignment.ResourceId -EnforcementMode Default
