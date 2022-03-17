
$c = New-AzRmStorageContainer -ResourceGroupName "myResourceGroup" -AccountName "mystorageaccount" -Name testcontainer -DefaultEncryptionScope "testscope" -PreventEncryptionScopeOverride $true

$c

$c.DefaultEncryptionScope

$c.DenyEncryptionScopeOverride
