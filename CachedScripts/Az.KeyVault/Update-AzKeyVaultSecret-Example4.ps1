
$VaultName = 'ContosoVault'

$Name = 'HR'

$ContentType = 'xml'

Get-AzKeyVaultKey -VaultName $VaultName -Name $Name -IncludeVersions | Update-AzKeyVaultSecret -ContentType $ContentType
