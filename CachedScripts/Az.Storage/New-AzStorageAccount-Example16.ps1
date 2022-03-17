
$account = New-AzStorageAccount -ResourceGroupName "MyResourceGroup" -AccountName "mystorageaccount" -SkuName Standard_LRS  -Location centraluseuap -Kind StorageV2 -EnableAccountLevelImmutability -ImmutabilityPeriod 1 -ImmutabilityPolicyState Unlocked

$account.ImmutableStorageWithVersioning.Enabled

$account.ImmutableStorageWithVersioning.ImmutabilityPolicy
