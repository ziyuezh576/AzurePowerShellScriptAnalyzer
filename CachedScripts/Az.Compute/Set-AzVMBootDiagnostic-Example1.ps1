
$VM = Get-AzVM -ResourceGroupName "ResourceGroup11" -Name "ContosoVM07"

Set-AzVMBootDiagnostic -VM $VM -Enable -ResourceGroupName "ResourceGroup11" -StorageAccountName "DiagnosticStorage"

Update-AzVM -VM $VM -ResourceGroupName "ResourceGroup11"
