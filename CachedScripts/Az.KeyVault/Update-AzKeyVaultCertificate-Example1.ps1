
$Tags = @{ "Team" = "Azure" ; "Role" = "Engg" }

Update-AzKeyVaultCertificate -VaultName "ContosoKV01" -Name "TestCert01" -Tag $Tags -PassThru
