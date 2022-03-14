
$VM = Get-AzVM -ResourceGroupName "ResourceGroup11" -VMName "ContosoVM07"

$VM = Set-AzVmSecurityProfile -VM $VM -SecurityType "TrustedLaunch"
