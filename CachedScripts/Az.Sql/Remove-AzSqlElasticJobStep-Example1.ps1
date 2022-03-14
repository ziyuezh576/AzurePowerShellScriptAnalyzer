
$jobStep = Get-AzSqlElasticJobStep -ResourceGroupName rg -ServerName elasticjobserver -AgentName agent -JobName job1 -Name step1

$jobStep | Remove-AzSqlElasticJobStep
