
$agent = Get-AzSqlElasticJobAgent -ResourceGroupName rg -ServerName elasticjobserver -Name agent

$agent | New-AzSqlElasticJobTargetGroup -Name tg1
