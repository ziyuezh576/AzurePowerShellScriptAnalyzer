
$account = Set-AzStorageAccount -ResourceGroupName "MyResourceGroup" -AccountName "mystorageaccount" -EnableAzureActiveDirectoryDomainServicesForFile $true -DefaultSharePermission StorageFileDataSmbShareOwner

$account.AzureFilesIdentityBasedAuth
