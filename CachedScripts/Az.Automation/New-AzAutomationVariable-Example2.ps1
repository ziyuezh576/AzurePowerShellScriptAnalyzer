
$VirtualMachine = Get-AzVM -ServiceName "VirtualMachine" -Name "VirtualMachine03"

New-AzAutomationVariable -AutomationAccountName "Contoso17" -Name "ComplexVariable01" -Encrypted $False -Value $VirtualMachine -ResourceGroupName "ResourceGroup01"
