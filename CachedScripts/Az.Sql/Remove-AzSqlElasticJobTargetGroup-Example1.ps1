
$agent = Get-AzSqlElasticJobAgent -ResourceGroupName rg -ServerName elasticjobserver -Name agent 

$agent | Remove-AzSqlElasticJobTargetGroup -Name tg1
