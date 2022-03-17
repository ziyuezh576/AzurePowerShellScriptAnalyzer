
$agent = Get-AzSqlElasticJobAgent -ResourceGroupName rg -ServerName elasticjobserver -Name agent

$agent | Get-AzSqlElasticJobTargetGroup -Name tg1
