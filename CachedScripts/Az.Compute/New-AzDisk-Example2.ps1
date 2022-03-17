
$diskconfig = New-AzDiskConfig -Location 'Central US' -DiskSizeGB 5 -SkuName Standard_LRS -OsType Windows -CreateOption Empty -EncryptionSettingsEnabled $true;

$diskConfig.EncryptionSettingsCollection = New-Object Microsoft.Azure.Management.Compute.Models.EncryptionSettingsCollection

$encryptionSettingsElement1 = New-Object Microsoft.Azure.Management.Compute.Models.EncryptionSettingsElement

$encryptionSettingsElement1.DiskEncryptionKey = New-Object Microsoft.Azure.Management.Compute.Models.KeyVaultAndSecretReference

$encryptionSettingsElement1.DiskEncryptionKey.SourceVault = New-Object Microsoft.Azure.Management.Compute.Models.SourceVault

$encryptionSettingsElement1.DiskEncryptionKey.SourceVault.Id = $disk_encryption_key_id_1

$encryptionSettingsElement1.DiskEncryptionKey.SecretUrl = $disk_encryption_secret_url_1

$encryptionSettingsElement1.KeyEncryptionKey = New-Object Microsoft.Azure.Management.Compute.Models.KeyVaultAndKeyReference

$encryptionSettingsElement1.KeyEncryptionKey.SourceVault = New-Object Microsoft.Azure.Management.Compute.Models.SourceVault

$encryptionSettingsElement1.KeyEncryptionKey.SourceVault.Id = $key_encryption_key_id_1

$encryptionSettingsElement1.KeyEncryptionKey.KeyUrl = $key_encryption_key_url_1

$encryptionSettingsElement2 = New-Object Microsoft.Azure.Management.Compute.Models.EncryptionSettingsElement

$encryptionSettingsElement2.DiskEncryptionKey = New-Object Microsoft.Azure.Management.Compute.Models.KeyVaultAndSecretReference

$encryptionSettingsElement2.DiskEncryptionKey.SourceVault = New-Object Microsoft.Azure.Management.Compute.Models.SourceVault

$encryptionSettingsElement2.DiskEncryptionKey.SourceVault.Id = $disk_encryption_key_id_2

$encryptionSettingsElement2.DiskEncryptionKey.SecretUrl = $disk_encryption_secret_url_2

$encryptionSettingsElement2.KeyEncryptionKey = New-Object Microsoft.Azure.Management.Compute.Models.KeyVaultAndKeyReference

$encryptionSettingsElement2.KeyEncryptionKey.SourceVault = New-Object Microsoft.Azure.Management.Compute.Models.SourceVault

$encryptionSettingsElement2.KeyEncryptionKey.SourceVault.Id = $key_encryption_key_id_2

$encryptionSettingsElement2.KeyEncryptionKey.KeyUrl = $key_encryption_key_url_2

$diskConfig.EncryptionSettingsCollection.EncryptionSettings += $encryptionSettingsElement1

$diskConfig.EncryptionSettingsCollection.EncryptionSettings += $encryptionSettingsElement2

New-AzDisk -ResourceGroupName 'ResourceGroup01' -DiskName 'Disk01' -Disk $diskconfig;
