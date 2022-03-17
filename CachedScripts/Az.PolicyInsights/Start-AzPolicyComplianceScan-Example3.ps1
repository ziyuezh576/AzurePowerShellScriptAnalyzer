
$job = Start-AzPolicyComplianceScan -AsJob

$job | Wait-Job
