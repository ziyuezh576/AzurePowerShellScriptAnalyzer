
$val = Get-AzSqlServer -ResourceGroupName "ResourceGroup01" -ExpandActiveDirectoryAdministrator

$val.Administrators
