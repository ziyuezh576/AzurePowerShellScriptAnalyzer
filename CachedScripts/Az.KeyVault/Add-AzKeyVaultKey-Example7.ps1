
$Password = ConvertTo-SecureString -String 'password' -AsPlainText -Force

$Expires = (Get-Date).AddYears(2).ToUniversalTime()

$Tags = @{ 'Severity' = 'high'; 'Accounting' = "true" }

Add-AzKeyVaultKey -VaultName 'contoso' -Name 'ITPfxToHSM' -Destination 'HSM' -KeyFilePath 'C:\Contoso\ITPfx.pfx' -KeyFilePassword $Password -Expires $Expires -Tag $Tags
