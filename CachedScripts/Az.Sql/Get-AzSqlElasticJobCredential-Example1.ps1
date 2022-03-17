
$agent = Get-AzSqlElasticJobAgent -ResourceGroupName rg -ServerName elasticjobserver -Name agent

$agent | Get-AzSqlElasticJobCredential -Name cred1
