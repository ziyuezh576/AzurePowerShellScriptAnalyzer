
New-AzSqlServer -ResourceGroupName "ResourceGroup01" -Location "Central US" -ServerName "server01" -ServerVersion "12.0" -ExternalAdminName DummyLogin -EnableActiveDirectoryOnlyAuthentication

$val = Get-AzSqlServer -ResourceGroupName "ResourceGroup01" -ServerName "server01" -ExpandActiveDirectoryAdministrator

$val.Administrators
