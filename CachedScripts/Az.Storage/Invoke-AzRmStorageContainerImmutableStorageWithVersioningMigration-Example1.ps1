
$t = Invoke-AzRmStorageContainerImmutableStorageWithVersioningMigration -ResourceGroupName "myResourceGroup" -AccountName "mystorageaccount" -Name testcontainer -asjob

$t | Wait-Job
