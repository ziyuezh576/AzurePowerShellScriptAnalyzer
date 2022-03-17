
New-AzEventHubNamespace -ResourceGroupName myresourcegroup -Name MyNamespaceName -Location northeurope -SkuName Premium -IdentityType SystemAssigned

$ec1 = New-AzEventHubEncryptionConfig -KeyName key1 -KeyVaultUri https://myvaultname.vault.azure.net

$ec2 = New-AzEventHubEncryptionConfig -KeyName key2 -KeyVaultUri https://myvaultname.vault.azure.net

Set-AzEventHubNamespace -ResourceGroupName myresourcegroup -Name MyNamespaceName -EncryptionConfig $ec1,$ec2
