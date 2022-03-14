
$Assignment = Get-AzPolicyAssignment -Name 'PolicyAssignment07'

Get-AzPolicyExemption -PolicyAssignmentIdFilter $Assignment.ResourceId
