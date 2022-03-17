
$Policy = New-AzKeyVaultCertificatePolicy -SecretContentType "application/x-pkcs12" -SubjectName "CN=contoso.com" -IssuerName "Self" -ValidityInMonths 6 -ReuseKeyOnRenewal

Add-AzKeyVaultCertificate -VaultName "ContosoKV01" -Name "TestCert01" -CertificatePolicy $Policy

Get-AzKeyVaultCertificateOperation -VaultName "ContosoKV01" -Name "TestCert01"

Get-AzKeyVaultCertificate -VaultName "ContosoKV01" -Name "TestCert01"
