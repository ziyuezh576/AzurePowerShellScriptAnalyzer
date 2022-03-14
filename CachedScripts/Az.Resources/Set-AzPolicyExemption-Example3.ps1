
$PolicyExemption = Get-AzPolicyExemption -Name 'PolicyExemption07'

Set-AzPolicyExemption -Id $PolicyExemption.ResourceId -ClearExpiration
