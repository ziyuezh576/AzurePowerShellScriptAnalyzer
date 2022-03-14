
$Jobs = Get-AzAutomationDscCompilationJob -ResourceGroupName "ResourceGroup01" -AutomationAccountName "Contoso17"

$Jobs[0] | Get-AzAutomationDscCompilationJobOutput -Stream "Any"
