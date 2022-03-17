
$namespace = Get-AzEventHubNamespace -ResourceGroupName myresourcegroup -Name MyNamespaceName

$ec3 = New-AzEventHubEncryptionConfig -KeyName key3 -KeyVaultUri https://myvaultname.vault.azure.net

$namespace.EncryptionConfig += $ec3

Set-AzEventHubNamespace -ResourceGroupName myresourcegroup -Name MyNamespaceName -EncryptionConfig $namespace.EncryptionConfig
