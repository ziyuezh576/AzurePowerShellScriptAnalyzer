
$password = ConvertTo-SecureString <YourPassword> -AsPlainText

Get-AzPostgreSqlFlexibleServerConnect -ResourceGroupName PowershellPostgreSqlTest -Name postgresql-test -AdministratorLoginPassword $password
