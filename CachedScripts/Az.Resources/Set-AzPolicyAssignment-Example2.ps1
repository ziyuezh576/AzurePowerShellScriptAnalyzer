
$PolicyAssignment = Get-AzPolicyAssignment -Name 'PolicyAssignment'

Set-AzPolicyAssignment -Id $PolicyAssignment.ResourceId -IdentityType 'SystemAssigned' -Location 'westus'
