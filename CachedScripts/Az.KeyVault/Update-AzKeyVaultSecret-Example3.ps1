
$Vault = 'ContosoVault'

$Prefix = 'IT'

Get-AzKeyVaultSecret $Vault | Where-Object {$_.Name -like $Prefix + '*'} | Update-AzKeyVaultSecret -Enable $False
