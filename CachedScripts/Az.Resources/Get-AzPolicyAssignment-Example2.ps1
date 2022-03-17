
$ResourceGroup = Get-AzResourceGroup -Name 'ResourceGroup11'

Get-AzPolicyAssignment -Name 'PolicyAssignment07' -Scope $ResourceGroup.ResourceId
