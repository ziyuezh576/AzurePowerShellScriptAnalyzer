
$ServerPassword = "newpassword"

$SecureString = ConvertTo-SecureString $ServerPassword -AsPlainText -Force

Set-AzSqlServer -ResourceGroupName "ResourceGroup01" -ServerName "Server01" -SqlAdministratorPassword $secureString
