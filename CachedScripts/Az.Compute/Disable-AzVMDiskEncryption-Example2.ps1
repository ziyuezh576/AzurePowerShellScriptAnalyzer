
$ResourceGroup = "Group002"

$VMName = "VM004"

$VolumeType = "Data"

Disable-AzVMDiskEncryption -ResourceGroupName $ResourceGroup -VMName $VMName -VolumeType $VolumeType
