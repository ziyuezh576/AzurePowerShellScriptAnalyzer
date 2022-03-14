
$account = Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -AccountName "mystorageaccount" -ImmutabilityPeriod 2 -ImmutabilityPolicyState Unlocked

$account.ImmutableStorageWithVersioning.Enabled

$account.ImmutableStorageWithVersioning.ImmutabilityPolicy
