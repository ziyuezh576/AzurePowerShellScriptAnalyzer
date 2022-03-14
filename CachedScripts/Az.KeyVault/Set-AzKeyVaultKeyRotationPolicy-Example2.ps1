
$key = Get-AzKeyVaultKey -VaultName test-kv -Name test-key

$action = [Microsoft.Azure.Commands.KeyVault.Models.PSKeyRotationLifetimeAction]::new()

$action.Action = "Rotate"

$action.TimeBeforeExpiry = New-TimeSpan -Days 30

Set-AzKeyVaultKeyRotationPolicy -InputObject $key -KeyRotationLifetimeAction $action
