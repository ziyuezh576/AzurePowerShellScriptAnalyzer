
$ResourceGroup = Get-AzResourceGroup -Name 'ResourceGroup11' 

$PolicyAssignment = Get-AzPolicyAssignment -Name 'PolicyAssignment07' -Scope $ResourceGroup.ResourceId

Remove-AzPolicyAssignment -Id $PolicyAssignment.ResourceId -Confirm
