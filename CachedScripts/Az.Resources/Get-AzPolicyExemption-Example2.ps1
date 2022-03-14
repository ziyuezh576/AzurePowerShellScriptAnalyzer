
$ResourceGroup = Get-AzResourceGroup -Name 'ResourceGroup11'

Get-AzPolicyExemption -Name 'PolicyExemption07' -Scope $ResourceGroup.ResourceId
