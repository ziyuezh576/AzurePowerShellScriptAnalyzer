
$x = Get-AzVMGuestPolicyStatusHistory -ResourceGroupName "MyResourceGroupName" -VMName "MyVMName"

$x[10].ReportId

Get-AzVMGuestPolicyStatus -ReportId $x[10].ReportId
