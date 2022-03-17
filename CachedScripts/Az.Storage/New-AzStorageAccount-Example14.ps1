
$account = New-AzStorageAccount -ResourceGroupName "MyResourceGroup" -AccountName "mystorageaccount" -SkuName Standard_LRS  -Location centraluseuap -Kind StorageV2 -EnableNfsV3 $true -EnableHierarchicalNamespace $true -EnableHttpsTrafficOnly $false -NetworkRuleSet (@{bypass="Logging,Metrics";

$account.EnableNfsV3
