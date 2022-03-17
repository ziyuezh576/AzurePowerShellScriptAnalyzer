
$policyAssignmentId = "/subscriptions/f0710c27-9663-4c05-19f8-1b4be01e86a5/providers/Microsoft.Authorization/policyAssignments/2deae24764b447c29af7c309"

Select-AzSubscription -Subscription f0710c27-9663-4c05-19f8-1b4be01e86a5

$job = Start-AzPolicyRemediation -PolicyAssignmentId $policyAssignmentId -Name "remediation1" -AsJob

$job | Wait-Job

$remediation = $job | Receive-Job
