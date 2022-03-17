
$RGName = "MyResourceGroup"

$VMName = "MyTestVM"

$VaultName= "MyKeyVault"

$KeyVault = Get-AzKeyVault -VaultName $VaultName -ResourceGroupName $RGName

$DiskEncryptionKeyVaultUrl = $KeyVault.VaultUri

$KeyVaultResourceId = $KeyVault.ResourceId

$KEKName = "MyKeyEncryptionKey"

$KEK = Add-AzKeyVaultKey -VaultName $VaultName -Name $KEKName -Destination "Software"

$KeyEncryptionKeyUrl = $KEK.Key.kid

$VolumeType = "All"

$CertPath = "C:\certificates\examplecert.pfx"

$CertPassword = "Password"

$Cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($CertPath, $CertPassword)

$CertValue = [System.Convert]::ToBase64String($cert.GetRawCertData())

$AzureAdApplication = New-AzADApplication -DisplayName "<Your Application Display Name>" -HomePage "<https://YourApplicationHomePage>" -IdentifierUris "<https://YouApplicationUri>" -CertValue $CertValue

$ServicePrincipal = New-AzADServicePrincipal -ApplicationId $AzureAdApplication.ApplicationId

$AADClientID = $AzureAdApplication.ApplicationId

$AADClientCertThumbprint= $Cert.Thumbprint

$KeyVaultSecretName = "MyAADCert"

$FileContentBytes = get-content $CertPath -Encoding Byte

$FileContentEncoded = [System.Convert]::ToBase64String($FileContentBytes)

$JSONObject = @"

$JSONObjectBytes = [System.Text.Encoding]::UTF8.GetBytes($JSONObject)

$JsonEncoded = [System.Convert]::ToBase64String($JSONObjectBytes)

$Secret = ConvertTo-SecureString -String $JSONEncoded -AsPlainText -Force

Set-AzKeyVaultSecret -VaultName $VaultName-Name $KeyVaultSecretName -SecretValue $Secret

Set-AzKeyVaultAccessPolicy -VaultName $VaultName -ResourceGroupName $RGName -EnabledForDeployment

$CertUrl = (Get-AzKeyVaultSecret -VaultName $VaultName -Name $KeyVaultSecretName).Id

$SourceVaultId = (Get-AzKeyVault -VaultName $VaultName -ResourceGroupName $RGName).ResourceId

$VM = Get-AzVM -ResourceGroupName $RGName -Name $VMName 

$VM = Add-AzVMSecret -VM $VM -SourceVaultId $SourceVaultId -CertificateStore "My" -CertificateUrl $CertUrl 

Update-AzVM -VM $VM -ResourceGroupName $RGName 

Set-AzVMDiskEncryptionExtension -ResourceGroupName $RGname -VMName $VMName -AadClientID $AADClientID -AadClientCertThumbprint $AADClientCertThumbprint -DiskEncryptionKeyVaultUrl $DiskEncryptionKeyVaultUrl -DiskEncryptionKeyVaultId $KeyVaultResourceId -KeyEncryptionKeyUrl $KeyEncryptionKeyUrl -KeyEncryptionKeyVaultId $KeyVaultResourceId -VolumeType $VolumeType
