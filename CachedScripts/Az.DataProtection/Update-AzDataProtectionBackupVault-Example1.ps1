
$tag = @{"Owner"="sarath";"Purpose"="AzureBackupTesting"}

Update-AzDataProtectionBackupVault -SubscriptionId "xxx-xxx-xxx" -ResourceGroupName sarath-rg -VaultName sarath-vault -Tag $tag
