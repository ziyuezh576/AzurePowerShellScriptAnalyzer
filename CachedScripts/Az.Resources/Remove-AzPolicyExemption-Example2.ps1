
$ResourceGroup = Get-AzResourceGroup -Name 'ResourceGroup11' 

$PolicyExemption = Get-AzPolicyExemption -Name 'PolicyExemption07' -Scope $ResourceGroup.ResourceId

Remove-AzPolicyExemption -Id $PolicyExemption.ResourceId -Confirm
