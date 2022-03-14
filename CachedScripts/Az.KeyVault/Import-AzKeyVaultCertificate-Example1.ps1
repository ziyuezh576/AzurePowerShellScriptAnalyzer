
$Password = ConvertTo-SecureString -String "123" -AsPlainText -Force

Import-AzKeyVaultCertificate -VaultName "ContosoKV01" -Name "ImportCert01" -FilePath "C:\Users\contosoUser\Desktop\import.pfx" -Password $Password
