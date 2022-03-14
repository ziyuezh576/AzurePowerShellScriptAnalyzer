
$RGName = "MyResourceGroup"

$VMName = "MyTestVM"

$VaultName= "MyKeyVault"

$KeyVault = Get-AzKeyVault -VaultName $VaultName -ResourceGroupName $RGName

$DiskEncryptionKeyVaultUrl = $KeyVault.VaultUri

$KeyVaultResourceId = $KeyVault.ResourceId

$VolumeType = "All"

$CertPath = "C:\certificates\examplecert.pfx"

$CertPassword = "Password"

$Cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($CertPath, $CertPassword)

$CertValue = [System.Convert]::ToBase64String($cert.GetRawCertData())

$AzureAdApplication = New-AzADApplication -DisplayName "<Your Application Display Name>" -HomePage "<https://YourApplicationHomePage>" -IdentifierUris "<https://YouApplicationUri>" -CertValue $CertValue 

$ServicePrincipal = New-AzADServicePrincipal -ApplicationId $AzureAdApplication.ApplicationId

$AADClientID = $AzureAdApplication.ApplicationId

$aadClientCertThumbprint= $cert.Thumbprint

$KeyVaultSecretName = "MyAADCert"

$FileContentBytes = get-content $CertPath -Encoding Byte

$FileContentEncoded = [System.Convert]::ToBase64String($fileContentBytes)

$JSONObject = @"

$JSONObjectBytes = [System.Text.Encoding]::UTF8.GetBytes($jsonObject)

$JSONEncoded = [System.Convert]::ToBase64String($jsonObjectBytes)

$Secret = ConvertTo-SecureString -String $JSONEncoded -AsPlainText -Force

Set-AzKeyVaultSecret -VaultName $VaultName -Name $KeyVaultSecretName -SecretValue $Secret

Set-AzKeyVaultAccessPolicy -VaultName $VaultName -ResourceGroupName $RGName -EnabledForDeployment

$CertUrl = (Get-AzKeyVaultSecret -VaultName $VaultName -Name $KeyVaultSecretName).Id

$SourceVaultId = (Get-AzKeyVault -VaultName $VaultName -ResourceGroupName $RGName).ResourceId

$VM = Get-AzVM -ResourceGroupName $RGName -Name $VMName 

$VM = Add-AzVMSecret -VM $VM -SourceVaultId $SourceVaultId -CertificateStore "My" -CertificateUrl $CertUrl

Update-AzVM -VM $VM -ResourceGroupName $RGName 

Set-AzVMDiskEncryptionExtension -ResourceGroupName $RGName -VMName $VMName -AadClientID $AADClientID -AadClientCertThumbprint $AADClientCertThumbprint -DiskEncryptionKeyVaultUrl $DiskEncryptionKeyVaultUrl -DiskEncryptionKeyVaultId $KeyVaultResourceId -VolumeType $VolumeType
