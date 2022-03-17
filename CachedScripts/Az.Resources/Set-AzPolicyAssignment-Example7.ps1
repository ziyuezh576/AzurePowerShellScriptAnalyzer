
$PolicyAssignment = Get-AzPolicyAssignment -Name 'VirtualMachinePolicy'

Set-AzPolicyAssignment -Id $PolicyAssignment.ResourceId -NonComplianceMessage @{Message="All resources must follow resource naming guidelines."}
