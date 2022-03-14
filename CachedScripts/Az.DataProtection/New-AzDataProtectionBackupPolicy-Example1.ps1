
$defaultPol = Get-AzDataProtectionPolicyTemplate -DatasourceType AzureDisk

New-AzDataProtectionBackupPolicy -SubscriptionId "xxxx-xxx-xxx" -ResourceGroupName sarath-rg -VaultName sarath-vault -Name "MyPolicy" -Policy $defaultPol
