
$Expires = (Get-Date).AddYears(2).ToUniversalTime()

$Tags = @{'Severity' = 'high'; 'Accounting' = 'true'}

Update-AzKeyVaultKey -VaultName 'Contoso' -Name 'ITSoftware' -Expires $Expires -Enable $True -Tag $Tags -PassThru
