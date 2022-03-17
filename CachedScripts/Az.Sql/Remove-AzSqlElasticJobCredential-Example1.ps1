
$agent = Get-AzSqlElasticJobAgent -ResourceGroupName rg -ServerName elasticjobserver -Name agent

$agent | Remove-AzSqlElasticJobCredential -Name cred1
