
$Password = ConvertTo-SecureString -String 'Password' -AsPlainText -Force

Add-AzKeyVaultKey -VaultName 'contoso' -Name 'ITPfx' -KeyFilePath 'C:\Contoso\ITPfx.pfx' -KeyFilePassword $Password
