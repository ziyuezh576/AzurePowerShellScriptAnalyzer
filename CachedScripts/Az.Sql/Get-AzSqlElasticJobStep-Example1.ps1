
$job = Get-AzSqlElasticJob -ResourceGroupName rg -ServerName elasticjobserver -AgentName agent -Name job1

$job | Get-AzSqlElasticJobStep -Name step1
