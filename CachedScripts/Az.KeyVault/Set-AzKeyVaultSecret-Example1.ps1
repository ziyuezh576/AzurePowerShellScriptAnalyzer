
$Secret = ConvertTo-SecureString -String 'Password' -AsPlainText -Force

Set-AzKeyVaultSecret -VaultName 'Contoso' -Name 'ITSecret' -SecretValue $Secret
