
$password = ConvertTo-SecureString <YourPassword> -AsPlainText

Get-AzMySqlFlexibleServerConnect -ResourceGroupName PowershellMySqlTest -Name mysql-test -AdministratorLoginPassword $password -Query "SELECT * FROM test"
