
$Secret = ConvertTo-SecureString -String 'Password' -AsPlainText -Force

$Expires = (Get-Date).AddYears(2).ToUniversalTime()

$NBF =(Get-Date).ToUniversalTime()

$Tags = @{ 'Severity' = 'medium'; 'IT' = 'true'}

$ContentType = 'txt'

Set-AzKeyVaultSecret -VaultName 'Contoso' -Name 'ITSecret' -SecretValue $Secret -Expires $Expires -NotBefore $NBF -ContentType $ContentType -Disable -Tags $Tags
