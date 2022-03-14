
$container = New-AzStorageContainer  -Name "mycontainer" -DefaultEncryptionScope "myencryptscope" -PreventEncryptionScopeOverride $true 

$container.BlobContainerProperties.DefaultEncryptionScope

$container.BlobContainerProperties.PreventEncryptionScopeOverride
