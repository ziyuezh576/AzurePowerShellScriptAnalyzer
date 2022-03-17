
$NextMonth = (Get-Date).AddMonths(1)

$PolicyExemption = Get-AzPolicyExemption -Name 'PolicyExemption07'

Set-AzPolicyExemption -Id $PolicyExemption.ResourceId -ExpiresOn $NextMonth
