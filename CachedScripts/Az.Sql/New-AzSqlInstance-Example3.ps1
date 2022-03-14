
$instancePool = Get-AzSqlInstancePool -ResourceGroupName resourcegroup01 -Name instancepool0

$instancePool | New-AzSqlInstance -Name managedInstance2 -AdministratorCredential (Get-Credential) -LicenseType LicenseIncluded -StorageSizeInGB 1024 -VCore 2
