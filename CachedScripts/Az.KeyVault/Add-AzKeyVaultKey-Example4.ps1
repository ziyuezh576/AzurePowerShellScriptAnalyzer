
$KeyOperations = 'decrypt', 'verify'

$Expires = (Get-Date).AddYears(2).ToUniversalTime()

$NotBefore = (Get-Date).ToUniversalTime()

$Tags = @{'Severity' = 'high'; 'Accounting' = "true"}

Add-AzKeyVaultKey -VaultName 'contoso' -Name 'ITHsmNonDefault' -Destination 'HSM' -Expires $Expires -NotBefore $NotBefore -KeyOps $KeyOperations -Disable -Tag $Tags
