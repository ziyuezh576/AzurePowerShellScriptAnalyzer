
$val = Get-AzSqlInstance -Name "managedInstance1" -ResourceGroupName "ResourceGroup01" -ExpandActiveDirectoryAdministrator

$val.Administrators
