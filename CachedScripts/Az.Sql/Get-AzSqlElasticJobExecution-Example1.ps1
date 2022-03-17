
$agent = Get-AzSqlElasticJobAgent -ResourceGroupName rg -ServerName elasticjobserver -Name agent

$agent | Get-AzSqlElasticJobExecution -Count 3
