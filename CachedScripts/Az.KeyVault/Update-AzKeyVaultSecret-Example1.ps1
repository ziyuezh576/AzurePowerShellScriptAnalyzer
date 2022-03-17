
$Expires = (Get-Date).AddYears(2).ToUniversalTime()

$Nbf = (Get-Date).ToUniversalTime()

$Tags = @{ 'Severity' = 'medium'; 'HR' = 'true'}

$ContentType= 'xml'

Update-AzKeyVaultSecret -VaultName 'ContosoVault' -Name 'HR' -Expires $Expires -NotBefore $Nbf -ContentType $ContentType -Enable $True -Tag $Tags -PassThru
