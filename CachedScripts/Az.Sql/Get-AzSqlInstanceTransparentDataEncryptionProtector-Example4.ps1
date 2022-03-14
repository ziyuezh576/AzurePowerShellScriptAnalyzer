
$managedInstance = Get-AzSqlInstance -Name 'ContosoManagedInstanceName' -ResourceGroupName 'ContosoResourceGroup'

$managedInstance | Get-AzSqlInstanceTransparentDataEncryptionProtector
