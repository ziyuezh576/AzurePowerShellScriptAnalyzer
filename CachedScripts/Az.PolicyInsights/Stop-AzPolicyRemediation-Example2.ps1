
$remediation = Get-AzPolicyRemediation -ManagementGroupName "mg1" -Name "remediation1"

$remediation | Stop-AzPolicyRemediation
