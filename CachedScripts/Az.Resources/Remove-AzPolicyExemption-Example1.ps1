
$ResourceGroup = Get-AzResourceGroup -Name 'ResourceGroup11'

Remove-AzPolicyExemption -Name 'PolicyExemption07' -Scope $ResourceGroup.ResourceId -Confirm
