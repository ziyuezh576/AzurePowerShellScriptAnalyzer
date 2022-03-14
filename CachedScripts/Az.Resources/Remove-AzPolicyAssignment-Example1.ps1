
$ResourceGroup = Get-AzResourceGroup -Name 'ResourceGroup11'

Remove-AzPolicyAssignment -Name 'PolicyAssignment07' -Scope $ResourceGroup.ResourceId -Confirm
