
$RGName = "MyResourceGroup"

$VMName = "MyTestVM"

$AADClientID = "<clientID of your Azure AD app>"

$AADClientSecret = "<clientSecret of your Azure AD app>"

$VaultName= "MyKeyVault"

$KeyVault = Get-AzKeyVault -VaultName $VaultName -ResourceGroupName $RGName

$DiskEncryptionKeyVaultUrl = $KeyVault.VaultUri

$KeyVaultResourceId = $KeyVault.ResourceId

$VolumeType = "All"

Set-AzVMDiskEncryptionExtension -ResourceGroupName $RGName -VMName $VMName -AadClientID $AADClientID -AadClientSecret $AADClientSecret -DiskEncryptionKeyVaultUrl $DiskEncryptionKeyVaultUrl -DiskEncryptionKeyVaultId $KeyVaultResourceId -VolumeType $VolumeType
