
$jobStep = Get-AzSqlElasticJobStep -ResourceGroupName rg -ServerName elasticjobserver -AgentName agent -JobName job1 -StepName step1

$jobStep | Set-AzSqlElasticJobStep -CommandText "SELECT 2"
