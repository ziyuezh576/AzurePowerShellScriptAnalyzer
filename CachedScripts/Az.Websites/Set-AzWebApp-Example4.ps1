
$hashtable =  @{myConnectionString = @{Type='MySql';Value='MySql Connection string'}}

Set-AzWebApp -Name 'ContosoWebApp' -ResourceGroupName 'Default-Web-WestUS' -ConnectionString $hashtable
