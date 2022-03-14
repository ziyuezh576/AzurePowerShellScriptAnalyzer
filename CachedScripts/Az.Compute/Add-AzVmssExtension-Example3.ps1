
$BatchFile = "runbook.sh"

$ResourceGroupName = "HelloRG"

$VMScaleSetName = "HelloVmSS"

$TypeHandlerVersion = 2.1

$protectedSettings = @{

$publicSettings = @{ 

$vmss = Get-AzVmss `
            -ResourceGroupName $ResourceGroupName `
            -VMScaleSetName $VMScaleSetName

Add-AzVmssExtension -VirtualMachineScaleSet $vmss `
    -Name "CustomScript" `
    -Publisher "Microsoft.Azure.Extensions" `
    -Type "CustomScript" `
    -TypeHandlerVersion $TypeHandlerVersion `
    -AutoUpgradeMinorVersion $true `
    -Setting $publicSettings `
    -ProtectedSetting $protectedSettings

Update-AzVmss `
    -ResourceGroupName $ResourceGroupName `
    -Name $VMScaleSetName `
    -VirtualMachineScaleSet $vmss
