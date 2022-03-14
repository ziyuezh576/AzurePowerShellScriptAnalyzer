
$val = Get-AzSqlServer -ResourceGroupName "ResourceGroup01" -ServerName "Server01" -ExpandActiveDirectoryAdministrator

$val.Administrators
