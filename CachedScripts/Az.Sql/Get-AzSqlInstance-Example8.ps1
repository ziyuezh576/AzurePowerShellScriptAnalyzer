
$val = Get-AzSqlInstance -ResourceGroupName "ResourceGroup01" -ExpandActiveDirectoryAdministrator

$val.Administrators
